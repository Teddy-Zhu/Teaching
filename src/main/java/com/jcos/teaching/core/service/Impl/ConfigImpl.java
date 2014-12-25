package com.jcos.teaching.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.ConfigMapper;
import com.jcos.teaching.core.model.Config;
import com.jcos.teaching.core.service.ConfigService;

@Service
public class ConfigImpl implements ConfigService {
	@Inject
	private ConfigMapper configDao;

	@Override
	public Config queryByName(String name) {
		return configDao.queryByName(name);
	}

	@Override
	public String getAllVersion() {
		return queryByName("version").getStrvalue() + "." + queryByName("funcversion").getStrvalue() + "." + queryByName("buildversion").getStrvalue();
	}
}
