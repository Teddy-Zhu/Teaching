package com.jcos.teaching.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcos.teaching.core.model.UserType;

public interface UserTypeMapper {
	int deleteByPrimaryKey(Integer intidentityid);

	int insert(UserType record);

	int insertSelective(UserType record);

	UserType selectByPrimaryKey(Integer intidentityid);

	int updateByPrimaryKeySelective(UserType record);

	int updateByPrimaryKey(UserType record);

	List<UserType> selectUserType(@Param(value = "allow") Integer allow);

	UserType selectUserTypeByName(@Param(value = "name") String name);

	int selectUserTypeCountByName(@Param(value = "name") String name);

}