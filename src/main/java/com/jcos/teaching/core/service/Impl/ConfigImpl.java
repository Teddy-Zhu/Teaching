package com.jcos.teaching.core.service.Impl;

import java.util.List;

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

	@Override
	public boolean updateConfigList(List<Config> list) {
		for (int i = 0, len = list.size(); i < len; i++) {
			Integer j = configDao.updateSelectiveByName(list.get(i));
			if (j != 1) {
				return false;
			}
		}
		return true;
	}
}
