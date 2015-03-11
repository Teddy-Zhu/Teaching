package com.jcos.teaching.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.Power;

public interface PowerMapper {
	int deleteByPrimaryKey(Integer intpowerid);

	int insert(Power record);

	int insertSelective(Power record);

	Power selectByPrimaryKey(Integer intpowerid);

	int updateByPrimaryKeySelective(Power record);

	int updateByPrimaryKey(Power record);

	List<Power> queryPowerByNameList(@Param(value = "name") String name, @Param(value = "intId") Integer IntId);

	Integer queryPowerByName(@Param(value = "name") String name, @Param(value = "intId") Integer IntId);

	List<Power> selectManagePower(@Param(value = "intparentid") int intparentid, @Param(value = "intusertypeid") int intusertypeid);

	Integer insertParentPower(Power record);

	Integer deletePowerByUserType(Integer intusertypeid);

	Integer insertPowerList(List<Power> powers);

	List<Power> selectPowerByUserType(List<Integer> usertypeids);

	Integer updatePowerListByAuthValue(@Param(value = "intauthvalue") int intauthvalue, @Param(value = "list") List<Integer> list);
}