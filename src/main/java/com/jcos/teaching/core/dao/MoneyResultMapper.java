package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.MoneyResult;

public interface MoneyResultMapper {
    int deleteByPrimaryKey(Integer intresultid);

    int insert(MoneyResult record);

    int insertSelective(MoneyResult record);

    MoneyResult selectByPrimaryKey(Integer intresultid);

    int updateByPrimaryKeySelective(MoneyResult record);

    int updateByPrimaryKey(MoneyResult record);
}