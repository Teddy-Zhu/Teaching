package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.UserType;

public interface UserTypeService {

	public List<UserType> getUserTypeForReg();

	public List<UserType> getUserType();

	boolean updateUserType(UserType record);

	boolean insertUserType(UserType record);

	boolean deleteUserType(Integer id);

}
