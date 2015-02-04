package com.jcos.teaching.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.VersionLog;

public interface VersionLogMapper {
	int deleteByPrimaryKey(Integer intid);

	int insert(VersionLog record);

	int insertSelective(VersionLog record);

	VersionLog selectByPrimaryKey(Integer intid);

	int updateByPrimaryKeySelective(VersionLog record);

	int updateByPrimaryKey(VersionLog record);
	
	List<VersionLog> queryVersions(@Param(value = "start") Integer start, @Param(value = "size") Integer size);

	int getTotalVersion();
}