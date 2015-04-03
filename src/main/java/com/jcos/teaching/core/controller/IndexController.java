package com.jcos.teaching.core.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.Menus;
import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.model.VersionLog;
import com.jcos.teaching.core.service.MenuService;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.service.VersionLogService;
import com.jcos.teaching.core.util.annotation.SetGlobalSettings;
import com.jcos.teaching.core.util.annotation.SetPerSettings;
import com.jcos.teaching.core.util.annotation.SetPower;

@Controller
public class IndexController {

	@Inject
	private VersionLogService versionLogService;

	@Inject
	private PowerService powerService;
	@Inject
	private UserService userService;
	@Inject
	private MenuService menusService;

	/**
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin(HttpServletRequest request, Model model) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession != null && loginSession.getLoginUser() != null) {
			return "redirect:/AdminMenu";
		}
		VersionLog version = versionLogService.queryCururentVersion();
		model.addAttribute("version", version.getStrversion() + "." + version.getStrfunversion() + "." + version.getStrbuildversion());
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		model.addAttribute("year", cal.get(Calendar.YEAR));
		return "index";
	}

	/**
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AdminMenu", method = RequestMethod.GET)
	@SetPerSettings(value = { "openAnimation" })
	@SetPower(value = "AdminMenu")
	public String adminmenu(HttpServletRequest request, Model model) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession != null) {
			model.addAttribute("user", loginSession.getLoginUser());
		}
		Map<String, String> menunames = new HashMap<String, String>();
		Map<String, String> menuicons = new HashMap<String, String>();
		List<Menus> menus = menusService.getAllMenus();
		for (int i = 0, len = menus.size(); i < len; i++) {
			Menus menu = menus.get(i);
			menunames.put(menu.getStrmenuvalue(), menu.getStrmenuname());
			menuicons.put(menu.getStrmenuvalue(), menu.getStrmenuiconclass());
		}
		model.addAttribute("menunames", menunames);
		model.addAttribute("menuicons", menuicons);
		return "AdminMenu";
	}

	/**
	 * @param request
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/ajax/dashboard", method = RequestMethod.GET)
	@SetPower(value = "dashboard")
	public String menu1(HttpServletRequest request, Model model, HttpServletResponse response) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		model.addAttribute("user", loginSession.getLoginUser());
		return "ajax/dashboard";
	}

	@RequestMapping(value = "/ajax/personinfo_manage", method = RequestMethod.GET)
	@SetPower(value = "personinfo_manage")
	public String menu2(HttpServletRequest request, Model model, HttpServletResponse response) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		User loginUser = loginSession.getLoginUser();
		User user = userService.selectUserById(loginUser.getIntid());
		loginSession.setLoginUser(user);
		request.getSession().setAttribute("loginSession", loginSession);
		model.addAttribute("user", user);
		return "/ajax/personinfo_manage";
	}

	@RequestMapping(value = "/ajax/book_manage", method = RequestMethod.GET)
	@SetPerSettings(value = { "bookgridsize" })
	@SetPower(value = "book_manage")
	public String menu3(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/book_manage";
	}

	@RequestMapping(value = "/ajax/userinfo_manage", method = RequestMethod.GET)
	@SetPerSettings(value = { "usergridsize" })
	@SetPower(value = "userinfo_manage")
	public String menu4(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/userinfo_manage";
	}

	@RequestMapping(value = "/ajax/supplier_manage", method = RequestMethod.GET)
	@SetPerSettings(value = { "suppliergridsize" })
	@SetPower(value = "supplier_manage")
	public String menu5(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/supplier_manage";
	}

	@RequestMapping(value = "/ajax/department_manage", method = RequestMethod.GET)
	@SetPower(value = "department_manage")
	public String menu6(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/department_manage";
	}

	@RequestMapping(value = "/ajax/type_manage", method = RequestMethod.GET)
	@SetPower(value = "type_manage")
	public String menu7(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/type_manage";
	}

	@RequestMapping(value = "/ajax/access_manage", method = RequestMethod.GET)
	@SetPower(value = "access_manage")
	public String menu8(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/access_manage";
	}

	@RequestMapping(value = "/ajax/plan_submit", method = RequestMethod.GET)
	@SetPower(value = "plan_submit")
	@SetGlobalSettings(value = { "AllowPlanSubmit" })
	public String menu9(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/plan_submit";
	}

	@RequestMapping(value = "/ajax/plan_query", method = RequestMethod.GET)
	@SetPerSettings(value = { "plangridsize" })
	@SetPower(value = "plan_query")
	public String menu10(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/plan_query";
	}

	@RequestMapping(value = "/ajax/plan_manage", method = RequestMethod.GET)
	@SetPerSettings(value = { "plangridsize" })
	@SetPower(value = "plan_manage")
	public String menu14(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/plan_manage";
	}

	@RequestMapping(value = "/ajax/menu_manage", method = RequestMethod.GET)
	@SetPower(value = "menu_manage")
	public String menu15(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/menu_manage";
	}
	@RequestMapping(value = "/ajax/system_settings", method = RequestMethod.GET)
	@SetGlobalSettings(value = { "AllowPlanSubmit" })
	@SetPower(value = "system_settings")
	public String menu12(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/system_settings";
	}

	@RequestMapping(value = "/ajax/personal_setting", method = RequestMethod.GET)
	@SetPerSettings(value = { "openAnimation", "bookgridsize", "usergridsize", "suppliergridsize", "plangridsize" })
	@SetPower(value = "personal_setting")
	public String menu11(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/personal_setting";
	}

	@RequestMapping(value = "/action/GetVersions", method = RequestMethod.POST)
	@ResponseBody
	public List<VersionLog> getbooks(Integer rows, Integer page, String text, HttpServletRequest request, Model model, HttpServletResponse response) {
		List<VersionLog> verions = versionLogService.getVersions(page, rows);
		return verions;
	}

}
