package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.PersonalConfig;

public interface PersonalConfigMapper {
	int deleteByPrimaryKey(Integer intpersonconfigid);

	int insert(PersonalConfig record);

	int insertSelective(PersonalConfig record);

	PersonalConfig selectByPrimaryKey(Integer intpersonconfigid);

	int updateByPrimaryKeySelective(PersonalConfig record);

	int updateByPrimaryKey(PersonalConfig record);

	PersonalConfig AddOrUpdatePersonalConfig(PersonalConfig record);

	Integer getPersonalConfig(PersonalConfig record);
}