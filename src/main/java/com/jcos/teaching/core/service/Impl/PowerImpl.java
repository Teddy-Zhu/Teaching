package com.jcos.teaching.core.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.PowerMapper;
import com.jcos.teaching.core.model.Power;
import com.jcos.teaching.core.service.PowerService;

@Service
public class PowerImpl implements PowerService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PowerImpl.class);

	@Inject
	private PowerMapper powerDao;

	@Override
	public Map<String, Boolean> queryPowerByName(List<String> list, Integer userId) {
		List<Power> pwlist = powerDao.queryPowerByName(list, userId);
		Map<String, Boolean> pwMap = new HashMap<String, Boolean>();
		int len = pwlist.size();
		for (int i = 0; i < len; i++) {
			pwMap.put(pwlist.get(i).getStrauthname(), pwlist.get(i).getIntauthvalue() == 0 ? false : true);
		}
		return pwMap;
	}

	@Override
	public boolean queryPowerByName(String name, Integer userId) {
		List<String> list = new ArrayList<String>();
		list.add(name);
		List<Power> pwlist = powerDao.queryPowerByName(list, userId);
		if (pwlist.get(0).getIntauthvalue() == 1)
			return true;
		else
			return false;
	}

	@Override
	public List<Power> selectParentPower(int intParentId, int UserTypeId) {
		return powerDao.selectManagePower(intParentId, UserTypeId);
	}

	@Override
	public boolean insertPower(Power record) {
		Integer i = powerDao.insertSelective(record);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean insertPowerRetId(Power record) {
		Integer i = powerDao.insertParentPower(record);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean deletePowerByUserType(int usertypeid) {
		Integer i = powerDao.deletePowerByUserType(usertypeid);
		if (i < 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean insertPowers(List<Power> powers) {
		Integer i = powerDao.insertPowerList(powers);
		if (i != powers.size()) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<Power> getPowerbyUserType(List<Integer> usertypeids) {
		return powerDao.selectPowerByUserType(usertypeids);
	}

	@Override
	public boolean updatePowers(Integer intauthvalue, List<Integer> list) {
		Integer i = powerDao.updatePowerListByAuthValue(intauthvalue, list);
		if (i != list.size()) {
			return false;
		} else {
			return true;
		}
	}
}
