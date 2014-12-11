package com.jcos.teaching.core.controller;

import com.jcos.teaching.core.Exmodel.LoginSession;
import com.jcos.teaching.core.Util.Common.StringUtil;
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

	private StringUtil tools = new StringUtil();

	@RequestMapping(value = "/AuthRegister", method = RequestMethod.POST)
	@ResponseBody
	public boolean register(HttpServletRequest request, Model model) {
		String userName = "", passWord = "", phone = "", realName = "", email = "";
		if (!tools.isNull(request, "UserName")) {
			userName = request.getParameter("UserName");
		}
		if (!tools.isNull(request, "PassWord")) {
			passWord = request.getParameter("PassWord");
		}
		if (!tools.isNull(request, "RealName")) {
			realName = request.getParameter("RealName");
		}
		if (!tools.isNull(request, "Phone")) {
			phone = request.getParameter("Phone");
		}
		if (!tools.isNull(request, "Email")) {
			email = request.getParameter("Email");
		}
		if (userName == "" || passWord == "" || phone == "" || realName == "" || email == "") {
			return false;
		}
		User record = new User();
		record.setUsername(userName);
		record.setPassword(passWord);
		record.setStrmail(email);
		record.setStrname(realName);
		record.setStrphone(phone);
		int i = userService.registerUser(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/AuthUserName", method = RequestMethod.POST)
	@ResponseBody
	public boolean authUserName(HttpServletRequest request, Model model) {
		String userName = "";
		if (!tools.isNull(request, "UserName")) {
			userName = request.getParameter("UserName");
		} else {
			return false;
		}
		int i = userService.selectUserByUserName(userName);
		if (i != 0) {
			return false;
		}
		return true;
	}

	@RequestMapping(value = "/AuthLogout", method = RequestMethod.POST)
	@ResponseBody
	public boolean authLogout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute("loginSession", null);
		return true;
	}

	@RequestMapping(value = "/AuthLogin", method = RequestMethod.POST)
	@ResponseBody
	public boolean authLogin(HttpServletRequest request, Model model) {
		String userName = "", passWord = "";

		if (!tools.isNull(request, "UserName") && !tools.isNull(request, "PassWord")) {
			userName = request.getParameter("UserName");
			passWord = request.getParameter("PassWord");
		} else {
			return false;
		}
		User record = new User();
		record.setUsername(userName);
		record.setPassword(passWord);

		User loginUser = userService.authLoginUser(record);
		if (loginUser != null) {
			LoginSession loginSession = new LoginSession();
			loginSession.setLoginUser(loginUser);
			// set global session
			request.getSession().setAttribute("loginSession", loginSession);
		} else {
			request.getSession().setAttribute("loginSession", null);
			return false;
		}
		return true;
	}
}
