package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Department;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer intdepartmentid);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer intdepartmentid);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}