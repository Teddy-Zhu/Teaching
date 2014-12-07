package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.Logs;

public interface LogsMapper {
    int deleteByPrimaryKey(Integer intlogid);

    int insert(Logs record);

    int insertSelective(Logs record);

    Logs selectByPrimaryKey(Integer intlogid);

    int updateByPrimaryKeySelective(Logs record);

    int updateByPrimaryKey(Logs record);
}