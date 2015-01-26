package com.jcos.teaching.core.dao;

import java.util.List;

import com.jcos.teaching.core.model.UserDepartMent;

public interface UserDepartMentMapper {
	int deleteByPrimaryKey(Integer intid);

	int insert(UserDepartMent record);

	int insertSelective(UserDepartMent record);

	UserDepartMent selectByPrimaryKey(Integer intid);

	int updateByPrimaryKeySelective(UserDepartMent record);

	int updateByPrimaryKey(UserDepartMent record);

	List<UserDepartMent> getUserDepartMent(int intparentid);
}