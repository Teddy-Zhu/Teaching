package com.jcos.teaching.core.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.Exmodel.LoginSession;
import com.jcos.teaching.core.model.UserDepartMent;
import com.jcos.teaching.core.service.PowerService;
import com.jcos.teaching.core.service.UserDepartMentService;

@Controller
@RequestMapping(value = "/DepartMent")
public class UserDepartMentController {
	@Inject
	private PowerService powerService;

	@Inject
	private UserDepartMentService userDepartMentService;

	public boolean authUserTypePower(HttpServletRequest request, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		return powerService.queryPowerByName(name, loginSession.getLoginUser().getIntid());
	}

	@RequestMapping(value = "/GetAllDepartMent", method = RequestMethod.POST)
	@ResponseBody
	public List<UserDepartMent> getAlldepartMent(HttpServletRequest request, Model model, HttpServletResponse response) {
		if (!authUserTypePower(request, "getalluserdepart")) {
			response.setStatus(3388);
			return null;
		}
		return userDepartMentService.getAllDepartMent();
	}

}
