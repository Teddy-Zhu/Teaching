package com.jcos.teaching.core.util;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.service.PowerService;

@Service
public class PowerTool {

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

	public boolean setModel(HttpServletRequest request, ModelAndView model, String name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		Integer userId = loginSession.getLoginUser().getIntid();
		Map<String, Boolean> pwMap = powerService.queryPowerByNameList(name, userId);
		for (Map.Entry<String, Boolean> entry : pwMap.entrySet()) {
			model.addObject(entry.getKey(), entry.getValue());
		}
		return true;
	}
}
