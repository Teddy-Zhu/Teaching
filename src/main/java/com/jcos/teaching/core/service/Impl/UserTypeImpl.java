package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.UserTypeMapper;
import com.jcos.teaching.core.model.UserType;
import com.jcos.teaching.core.service.UserTypeService;

@Service
public class UserTypeImpl implements UserTypeService {

	@Inject
	private UserTypeMapper userTypeDao;

	@Override
	public List<UserType> getUserTypeForReg() {
		return userTypeDao.selectUserTypeForReg(1);
	}
}
