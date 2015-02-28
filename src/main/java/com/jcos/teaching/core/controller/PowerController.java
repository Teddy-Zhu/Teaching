package com.jcos.teaching.core.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.service.PowerService;

@Controller
@RequestMapping(value = "/Power")
public class PowerController {

	@Inject
	private PowerService powerService;
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

}
