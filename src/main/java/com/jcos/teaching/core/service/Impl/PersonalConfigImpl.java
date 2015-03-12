package com.jcos.teaching.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.PersonalConfigMapper;
import com.jcos.teaching.core.model.PersonalConfig;
import com.jcos.teaching.core.service.PersonalConfigService;

@Service
public class PersonalConfigImpl implements PersonalConfigService {
	@Inject
	private PersonalConfigMapper personalConfigDao;

	@Override
	public boolean addOrUpdatePersonalConfig(PersonalConfig record) {
		Integer i = personalConfigDao.AddOrUpdatePersonalConfig(record);
		if (i == 1) {
			return true;
		} else {
			return false;
		}
	}
}
