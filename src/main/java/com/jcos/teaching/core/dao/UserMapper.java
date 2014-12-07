package com.jcos.teaching.core.dao;

import java.util.List;

import com.jcos.teaching.core.model.User;

public interface UserMapper {
	int deleteByPrimaryKey(Integer intid);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer intid);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	Integer selectUserByUserName(String userName);

	List<User> selectUserSelective(User record);

	Integer InertUser(User record);
}