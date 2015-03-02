package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.Power;

public interface PowerService {

	boolean queryPowerByName(String name, Integer userType);

	boolean insertPower(Power record);

	boolean insertPowerRetId(Power record);

	List<Power> selectParentPower(int intParentId, int UserTypeId);

	boolean deletePowerByUserType(int usertypeid);

	boolean insertPowers(List<Power> powers);

	List<Power> getPowerbyUserType(List<Integer> usertypeids);

}
