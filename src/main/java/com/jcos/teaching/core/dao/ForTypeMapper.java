package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.ForType;

public interface ForTypeMapper {
    int deleteByPrimaryKey(Integer intforid);

    int insert(ForType record);

    int insertSelective(ForType record);

    ForType selectByPrimaryKey(Integer intforid);

    int updateByPrimaryKeySelective(ForType record);

    int updateByPrimaryKey(ForType record);
}