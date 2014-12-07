package com.jcos.teaching.core.dao;

import com.jcos.teaching.core.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer intid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer intid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}