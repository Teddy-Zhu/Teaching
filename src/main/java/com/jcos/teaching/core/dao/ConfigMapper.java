package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Config;

public interface ConfigMapper {
	int deleteByPrimaryKey(Integer intconfigid);

	int insert(Config record);

	int insertSelective(Config record);

	Config selectByPrimaryKey(Integer intconfigid);

	int updateByPrimaryKeySelective(Config record);

	int updateByPrimaryKey(Config record);

	Config queryByName(String name);

	Integer updateSelectiveByName(Config record);
}