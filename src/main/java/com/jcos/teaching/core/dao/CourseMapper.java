package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer intcourseid);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer intcourseid);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}