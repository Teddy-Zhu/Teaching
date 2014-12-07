package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.UserType;

public interface UserTypeMapper {
    int deleteByPrimaryKey(Integer intidentityid);

    int insert(UserType record);

    int insertSelective(UserType record);

    UserType selectByPrimaryKey(Integer intidentityid);

    int updateByPrimaryKeySelective(UserType record);

    int updateByPrimaryKey(UserType record);
}