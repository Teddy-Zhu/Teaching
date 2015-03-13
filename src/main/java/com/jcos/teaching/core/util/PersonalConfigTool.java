package com.jcos.teaching.core.util;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jcos.teaching.core.exmodel.LoginSession;
import com.jcos.teaching.core.model.PersonalConfig;
import com.jcos.teaching.core.service.PersonalConfigService;

@Service
public class PersonalConfigTool {
	@Inject
	private PersonalConfigService personalConfigService;

	public boolean setModelPConfig(HttpServletRequest request, Model model, List<String> name) {
		LoginSession loginSession = (LoginSession) request.getSession().getAttribute("loginSession");
		if (loginSession == null) {
			return false;
		}
		Integer userId = loginSession.getLoginUser().getIntid();
		PersonalConfig record = new PersonalConfig();
		record.setIntuserid(loginSession.getLoginUser().getIntid());
		Integer defaultValue = 10;
		for (int i = 0, len = name.size(); i < len; i++) {
			record.setStrconfigname(name.get(i));
			if (name.get(i).contains("size")) {
				defaultValue = 10;
			} else {
				defaultValue = 1;
			}
			Integer ret = personalConfigService.getPersonalConfig(record);
			model.addAttribute(name.get(i), ret == null ? defaultValue : ret);
		}
		return true;
	}
}
