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
		return userTypeDao.selectUserType(1);
	}

	@Override
	public List<UserType> getUserType() {
		return userTypeDao.selectUserType(null);
	}

	@Override
	public boolean updateUserType(UserType record) {
		Integer i = userTypeDao.updateByPrimaryKey(record);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean insertUserType(UserType record) {
		Integer i = userTypeDao.insertSelective(record);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean deleteUserType(Integer id) {
		Integer i = userTypeDao.deleteByPrimaryKey(id);
		if (i != 1) {
			return false;
		} else {
			return true;
		}
	}
}
