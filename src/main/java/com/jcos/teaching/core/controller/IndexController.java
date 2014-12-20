package com.jcos.teaching.core.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcos.teaching.core.Exmodel.LoginSession;

@Controller
public class IndexController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin(HttpServletRequest request, Model model) {
		return "index";
	}

	@RequestMapping(value = "/AdminMenu", method = RequestMethod.GET)
	public String adminmenu(HttpServletRequest request, Model model) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession != null && !loginSession.getLoginUser().getUsername().trim().equals(""))
			request.getSession().setAttribute("loginUser", loginSession.getLoginUser().getUsername());
		else
			request.getSession().setAttribute("loginUser", "NoUser");
		return "AdminMenu";
	}

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

}
