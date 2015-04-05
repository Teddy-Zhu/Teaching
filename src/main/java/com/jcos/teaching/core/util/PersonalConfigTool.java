package com.jcos.teaching.core.util;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.Config;
import com.jcos.teaching.core.model.PersonalConfig;
import com.jcos.teaching.core.service.ConfigService;
import com.jcos.teaching.core.service.PersonalConfigService;

@Service
public class PersonalConfigTool {
	@Inject
	private PersonalConfigService personalConfigService;
	@Inject
	private ConfigService configService;

	public boolean setModelPConfig(HttpServletRequest request, ModelAndView model, String[] name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		Integer userId = loginSession.getLoginUser().getIntid();
		PersonalConfig record = new PersonalConfig();
		record.setIntuserid(userId);
		Integer defaultValue = 10;
		for (int i = 0, len = name.length; i < len; i++) {
			record.setStrconfigname(name[i]);
			if (name[i].contains("size")) {
				defaultValue = 10;
			} else {
				defaultValue = 1;
			}
			Integer ret = personalConfigService.getPersonalConfig(record);
			model.addObject(name[i], ret == null ? defaultValue : ret);
		}
		return true;
	}

	public boolean setGlobalConfig(ModelAndView model, String[] name) {
		List<Config> configs = configService.queryByNames(name);
		for (int i = 0, len = configs.size(); i < len; i++) {
			Config config = configs.get(i);
			model.addObject(config.getStrname(), config.getStrvalue());
		}
		return true;
	}
}
