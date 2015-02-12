package com.jcos.teaching.core.dao;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Integer intpowerid);

    int insert(Power record);

    int insertSelective(Power record);

    Power selectByPrimaryKey(Integer intpowerid);

    int updateByPrimaryKeySelective(Power record);

    int updateByPrimaryKey(Power record);
	
	Integer queryPowerByName(@Param(value = "name") String name, @Param(value = "intId") Integer IntId);
}