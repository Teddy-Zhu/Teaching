package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Operation;

public interface OperationMapper {
    int deleteByPrimaryKey(Integer intoperationid);

    int insert(Operation record);

    int insertSelective(Operation record);

    Operation selectByPrimaryKey(Integer intoperationid);

    int updateByPrimaryKeySelective(Operation record);

    int updateByPrimaryKey(Operation record);
}