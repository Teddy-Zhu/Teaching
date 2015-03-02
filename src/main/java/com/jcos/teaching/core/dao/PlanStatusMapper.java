package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.PlanStatus;

public interface PlanStatusMapper {
    int deleteByPrimaryKey(Integer intplanstatusid);

    int insert(PlanStatus record);

    int insertSelective(PlanStatus record);

    PlanStatus selectByPrimaryKey(Integer intplanstatusid);

    int updateByPrimaryKeySelective(PlanStatus record);

    int updateByPrimaryKey(PlanStatus record);
}