package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.UserDepartMent;

public interface UserDepartMentService {

	List<UserDepartMent> getAllDepartMent(int id);

	Integer getParentDepartMent(int intid);

	boolean authDepartAndMajor(int DepartId, int Major);

}
