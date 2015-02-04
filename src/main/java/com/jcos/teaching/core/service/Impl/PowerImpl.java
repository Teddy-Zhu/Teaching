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
	public boolean queryPowerByName(String name, Integer userId) {
		Integer i = powerDao.queryPowerByName(name, userId);
		if (i == null)
			i = 0;
		if (i == 1)
			return true;
		else
			return false;
	}
}
