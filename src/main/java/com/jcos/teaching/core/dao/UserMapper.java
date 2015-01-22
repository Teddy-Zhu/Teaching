package com.jcos.teaching.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.User;

public interface UserMapper {
	int deleteByPrimaryKey(Integer intid);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer intid);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	Integer selectUserByUserName(@Param(value = "username") String userName);

	List<User> selectUserSelective(User record);

	Integer InertUser(User record);

	User authLoginUser(@Param(value = "username") String userName, @Param(value = "password") String passWord);
}