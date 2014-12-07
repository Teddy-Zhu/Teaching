package com.jcos.teaching.core.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.UserTypeService;

@Controller
public class UserTypeController {

	@Inject
	private UserTypeService userTypeService;

	@RequestMapping(value = "/userType", method = RequestMethod.POST)
	@ResponseBody
	public List<UserType> authUserName(HttpServletRequest request, Model model) {
		List<UserType> allowUserType = userTypeService.getUserTypeForReg();
		return allowUserType;
	}
}
