package com.jcos.teaching.core.service.Impl;

import org.apache.log4j.Logger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.PersonalConfigMapper;
import com.jcos.teaching.core.model.PersonalConfig;
import com.jcos.teaching.core.service.PersonalConfigService;

@Service
public class PersonalConfigImpl implements PersonalConfigService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PersonalConfigImpl.class);

	@Inject
	private PersonalConfigMapper personalConfigDao;

	@Override
	public boolean addOrUpdatePersonalConfig(List<PersonalConfig> record) {

		for (int i = 0, len = record.size(); i < len; i++) {
			PersonalConfig result = personalConfigDao.AddOrUpdatePersonalConfig(record.get(i));
			if (result == null || result.getIntpersonconfigid() == null) {
				return false;
			}
		}
		return true;
	}

	@Override
	public Integer getPersonalConfig(PersonalConfig record) {
		return personalConfigDao.getPersonalConfig(record);
	}
}
