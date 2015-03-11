package com.jcos.teaching.core.service;

import java.util.List;
import java.util.Map;

import com.jcos.teaching.core.model.Power;

public interface PowerService {

	boolean insertPower(Power record);

	boolean insertPowerRetId(Power record);

	List<Power> selectParentPower(int intParentId, int UserTypeId);

	boolean deletePowerByUserType(int usertypeid);

	boolean insertPowers(List<Power> powers);

	List<Power> getPowerbyUserType(List<Integer> usertypeids);

	boolean updatePowers(Integer intauthvalue, List<Integer> list);

	boolean queryPowerByName(String name, Integer userId);

	Map<String, Boolean> queryPowerByName(List<String> list, Integer userId);

}
