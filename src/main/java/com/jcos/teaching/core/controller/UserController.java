package com.jcos.teaching.core.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.service.UserService;

@Controller
public class UserController {
	@Inject
	private UserService userService;

	@RequestMapping(value = "/AuthRegister", method = RequestMethod.POST)
	@ResponseBody
	public boolean register(HttpServletRequest request, Model model) {
		String userName = "", passWord = "", phone = "", realName = "", email = "";
		if (request.getParameter("UserName") != null && !request.getParameter("UserName").equals(""))
			userName = request.getParameter("UserName");
		if (request.getParameter("PassWord") != null && !request.getParameter("PassWord").equals(""))
			passWord = request.getParameter("PassWord");
		if (request.getParameter("RealName") != null && !request.getParameter("RealName").equals(""))
			realName = request.getParameter("RealName");
		if (request.getParameter("Phone") != null && !request.getParameter("Phone").equals(""))
			phone = request.getParameter("Phone");
		if (request.getParameter("Email") != null && !request.getParameter("Email").equals(""))
			email = request.getParameter("Email");
		if (userName == "" || passWord == "" || phone == "" || realName == "" || email == "")
			return false;
		User record = new User();
		record.setUsername(userName);
		record.setPassword(passWord);
		record.setStrmail(email);
		record.setStrname(realName);
		record.setStrphone(phone);
		int i = userService.registerUser(record);
		if (i == 1)
			return true;
		else
			return false;
	}

	@RequestMapping(value = "/AuthUserName", method = RequestMethod.POST)
	@ResponseBody
	public boolean authUserName(HttpServletRequest request, Model model) {
		String userName = "";
		if (request.getParameter("UserName") != null && !request.getParameter("UserName").equals(""))
			userName = request.getParameter("UserName");
		if (userName == "")
			return false;
		int i = userService.selectUserByUserName(userName);
		if (i != 0)
			return false;
		return true;
	}
}
