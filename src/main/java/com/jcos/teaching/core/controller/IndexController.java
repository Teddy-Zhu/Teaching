package com.jcos.teaching.core.controller;

import java.util.Calendar;
import java.util.Date;
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
import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.model.VersionLog;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.service.VersionLogService;
import com.jcos.teaching.core.util.annotation.SetPower;
import com.jcos.teaching.core.util.annotation.SetSettings;

@Controller
public class IndexController {

	@Inject
	private VersionLogService versionLogService;

	@Inject
	private PowerService powerService;
	@Inject
	private UserService userService;

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin(HttpServletRequest request, Model model) {
		VersionLog version = versionLogService.queryCururentVersion();
		model.addAttribute("version", version.getStrversion() + "." + version.getStrfunversion() + "." + version.getStrbuildversion());
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		model.addAttribute("year", cal.get(Calendar.YEAR));
		return "index";
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/AdminMenu", method = RequestMethod.GET)
	@SetSettings(value = { "openAnimation" })
	@SetPower(value = "AdminMenu")
	public String adminmenu(HttpServletRequest request, Model model) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession != null) {
			model.addAttribute("user", loginSession.getLoginUser());
		}
		return "AdminMenu";
	}

	/**
	 * 
	 * @param html
	 * @param request
	 * @param model
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
	@SetSettings(value = { "bookgridsize" })
	@SetPower(value = "book_manage")
	public String menu3(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/book_manage";
	}

	@RequestMapping(value = "/ajax/userinfo_manage", method = RequestMethod.GET)
	@SetSettings(value = { "usergridsize" })
	@SetPower(value = "userinfo_manage")
	public String menu4(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/userinfo_manage";
	}

	@RequestMapping(value = "/ajax/supplier_manage", method = RequestMethod.GET)
	@SetSettings(value = { "suppliergridsize" })
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
	public String menu9(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/plan_submit";
	}

	@RequestMapping(value = "/ajax/plan_query", method = RequestMethod.GET)
	@SetSettings(value = { "plangridsize" })
	@SetPower(value = "plan_query")
	public String menu10(HttpServletRequest request, Model model, HttpServletResponse response) {
		return "/ajax/plan_query";
	}

	@RequestMapping(value = "/ajax/personal_setting", method = RequestMethod.GET)
	@SetSettings(value = { "openAnimation", "bookgridsize", "usergridsize", "suppliergridsize", "plangridsize" })
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

	public boolean setModel(HttpServletRequest request, Model model, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		Integer userId = loginSession.getLoginUser().getIntid();
		Map<String, Boolean> pwMap = powerService.queryPowerByNameList(name, userId);
		for (Map.Entry<String, Boolean> entry : pwMap.entrySet()) {
			model.addAttribute(entry.getKey(), entry.getValue());
		}
		return true;
	}
}
