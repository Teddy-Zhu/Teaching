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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.Exmodel.LoginSession;
import com.jcos.teaching.core.model.Book;
import com.jcos.teaching.core.model.VersionLog;
import com.jcos.teaching.core.service.ConfigService;
import com.jcos.teaching.core.service.VersionLogService;

@Controller
public class IndexController {

	@Inject
	private VersionLogService versionLogService;

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
		if (loginSession != null && !loginSession.getLoginUser().getUsername().trim().equals(""))
			request.getSession().setAttribute("loginUser", loginSession.getLoginUser().getUsername());
		else
			request.getSession().setAttribute("loginUser", "NoUser");
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
	public String adminmenu(@PathVariable String html, HttpServletRequest request, Model model) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null)
			return "action/403";
		if (html.equals("dashboard")) {
			model.addAttribute("userEmail", loginSession.getLoginUser().getStrmail());
			model.addAttribute("userPhone", loginSession.getLoginUser().getStrphone());
			model.addAttribute("userRegTime", loginSession.getLoginUser().getDateregtime().toString());
			model.addAttribute("userGroup", loginSession.getLoginUser().getUserType().getStrname());
		}
		return "ajax/" + html;
	}

	@RequestMapping(value = "/action/GetVersions", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getbooks(Integer rows, Integer page, String text, HttpServletRequest request, Model model, HttpServletResponse response) {
		Map<String, Object> ret = new HashMap<String, Object>();
		ret.put("total", versionLogService.getTotal());
		List<VersionLog> verions = versionLogService.getVersions(page, rows);
		ret.put("rows", verions);
		return ret;
	}

}
