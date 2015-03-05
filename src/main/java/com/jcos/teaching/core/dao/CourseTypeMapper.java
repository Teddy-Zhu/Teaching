package com.jcos.teaching.core.dao;

import java.util.List;

import com.jcos.teaching.core.model.CourseType;

public interface CourseTypeMapper {
	int deleteByPrimaryKey(Integer intcoursetypeid);

	int insert(CourseType record);

	int insertSelective(CourseType record);

	CourseType selectByPrimaryKey(Integer intcoursetypeid);

	int updateByPrimaryKeySelective(CourseType record);

	int updateByPrimaryKey(CourseType record);

	List<CourseType> selectAllCourseType();
}