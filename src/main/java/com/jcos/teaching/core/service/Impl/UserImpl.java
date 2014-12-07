package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.UserMapper;
import com.jcos.teaching.core.model.User;
import com.jcos.teaching.core.service.UserService;

@Service
public class UserImpl implements UserService {
	@Inject
	private UserMapper userDao;

	@Override
	public List<User> selectUserSelective(User record) {
		if (record != null)
			return userDao.selectUserSelective(record);
		else
			return null;
	}

	@Override
	public Integer selectUserByUserName(String userName) {
		if (userName != null && !userName.equals(""))
			return userDao.selectUserByUserName(userName);
		else
			return null;
	}

	@Override
	public Integer registerUser(User record) {
		if (record.getStrname().equals("") || record.getPassword().equals("") || record.getStrmail().equals("") || record.getStrphone().equals("") || record.getUsername().equals(""))
			return 0;
		else
			return userDao.InertUser(record);
	}
}
