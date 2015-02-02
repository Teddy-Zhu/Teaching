package com.jcos.teaching.core.service.Impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jcos.teaching.core.dao.UserDepartMentMapper;
import com.jcos.teaching.core.model.UserDepartMent;
import com.jcos.teaching.core.service.UserDepartMentService;

@Service
public class UserDepartMentImpl implements UserDepartMentService {

	@Inject
	private UserDepartMentMapper userDepartMentDao;

	@Override
	public List<UserDepartMent> getAllDepartMent(int id) {
		return userDepartMentDao.getUserDepartMent(id);
	}

	@Override
	public Integer getParentDepartMent(int intid) {
		Integer i = userDepartMentDao.getParentUserDepartMent(intid);
		if (i == null)
			i = -1;
		return i;
	}
}
