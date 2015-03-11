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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.model.VersionLog;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserService;
import com.jcos.teaching.core.service.VersionLogService;
import com.jcos.teaching.core.util.PropertiesTool;

@Controller
public class IndexController {

	@Inject
	private VersionLogService versionLogService;

	@Inject
	private PowerService powerService;
	@Inject
	private UserService userService;

	private PropertiesTool pwTool = new PropertiesTool("loadPower");

	/**
	 * 
	 * @param request
	 * @return
	 */
	public boolean authUserTypePower(HttpServletRequest request, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		return powerService.queryPowerByName(name, loginSession.getLoginUser().getIntid());
	}

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
	public String adminmenu(HttpServletRequest request, Model model) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession != null && !loginSession.getLoginUser().getUsername().trim().equals("")) {
			setModel(request, model, pwTool.getPowerList("AdminMenu"));
			request.getSession().setAttribute("loginUser", loginSession.getLoginUser().getUsername());
		} else {
			request.getSession().setAttribute("loginSession", null);
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
	@RequestMapping(value = "/ajax/{html}", method = RequestMethod.GET)
	public String adminmenu(@PathVariable String html, HttpServletRequest request, Model model, HttpServletResponse response) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			response.setStatus(3389);
			return "ajax/index";
		}
		switch (html) {
		case "dashboard": {
			model.addAttribute("userEmail", loginSession.getLoginUser().getStrmail());
			model.addAttribute("userPhone", loginSession.getLoginUser().getStrphone());
			model.addAttribute("userRegTime", loginSession.getLoginUser().getDateregtime().toString());
			model.addAttribute("userGroup", loginSession.getLoginUser().getUserType().getStrname());
			break;
		}
		case "personinfo_manage": {
			User loginUser = loginSession.getLoginUser();
			User user = userService.selectUserById(loginUser.getIntid());
			loginSession.setLoginUser(user);
			request.getSession().setAttribute("loginSession", loginSession);
			model.addAttribute("user", user);
			break;
		}
		case "book_manage":
		case "userinfo_manage":
		case "supplier_manage":
		case "department_manage":
		case "type_manage":
		case "access_manage":
		case "plan_submit":
		case "plan_query":
		default: {
			setModel(request, model, pwTool.getPowerList(html));
			break;
		}
		}
		return "ajax/" + html;
	}

	@RequestMapping(value = "/action/GetVersions", method = RequestMethod.POST)
	@ResponseBody
	public List<VersionLog> getbooks(Integer rows, Integer page, String text, HttpServletRequest request, Model model, HttpServletResponse response) {
		List<VersionLog> verions = versionLogService.getVersions(page, rows);
		return verions;
	}

	public boolean setModel(HttpServletRequest request, Model model, List<String> powers) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		Integer userId = loginSession.getLoginUser().getIntid();
		Map<String, Boolean> pwMap = powerService.queryPowerByName(powers, userId);
		for (Map.Entry<String, Boolean> entry : pwMap.entrySet()) {
			model.addAttribute(entry.getKey(), entry.getValue());
		}
		return true;
	}
}
