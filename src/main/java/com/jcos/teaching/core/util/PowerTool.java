package com.jcos.teaching.core.util;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.Config;
import com.jcos.teaching.core.service.ConfigService;
import com.jcos.teaching.core.service.PowerService;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import java.util.Map;

@Service
public class PowerTool {

	@Inject
	private PowerService powerService;
	@Inject
	private ConfigService configService;

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

	public boolean authGlobalConfig(String name) {
		Config config = configService.queryByName(name);
		if (config == null) {
			return false;
		} else {
			return Integer.valueOf(config.getStrvalue()) == 1 ? true : false;
		}
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
