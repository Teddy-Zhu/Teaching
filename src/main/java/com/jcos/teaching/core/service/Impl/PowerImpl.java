package com.jcos.teaching.core.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.PowerMapper;
import com.jcos.teaching.core.model.Power;
import com.jcos.teaching.core.service.PowerService;

@Service
public class PowerImpl implements PowerService {

	@Inject
	private PowerMapper powerDao;

	@Override
	public boolean queryBookPowerByName(String name, Integer userType) {
		Power record = new Power();
		record.setIntusertypeid(userType);
		record.setStrauthname(name);
		Integer i = powerDao.queryPowerByName(record);
		if (i == null)
			i = 0;
		if (powerDao.queryPowerByName(record) == 1)
			return true;
		else
			return false;
	}
}
