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
		if (record != null) {
			return userDao.selectUserSelective(record);
		} else {
			return null;
		}
	}

	@Override
	public Integer selectUserByUserName(String userName) {
		if (userName != null && !userName.equals("")) {
			return userDao.selectUserByUserName(userName);
		} else {
			return 1;
		}
	}

	@Override
	public Integer selectUserByUserNameAndId(String userName, int userId) {
		if (userName != null && !userName.equals("")) {
			return userDao.selectUserByUserNameAndId(userName, userId);
		} else {
			return 1;
		}
	}

	@Override
	public Integer registerUser(User record) {
		if (record.getStrname().equals("") || record.getPassword().equals("") || record.getStrmail().equals("") || record.getStrphone().equals("") || record.getUsername().equals("")) {
			return 0;
		} else {
			return userDao.InertUser(record);
		}
	}

	@Override
	public User authLoginUserForUpdateInfo(User record) {
		if (record.getIntid() == 0 || record.getUsername() == null || record.getUsername().equals("") || record.getPassword() == null || record.getPassword().equals("")) {
			return null;
		} else {
			return userDao.authUserByIdUserNamePass(record.getIntid(), record.getUsername(), record.getPassword());
		}
	}

	@Override
	public User authLoginUser(User record) {
		if (record.getUsername() == null || record.getUsername().equals("") || record.getPassword() == null || record.getPassword().equals("")) {
			return null;
		} else {
			return userDao.authLoginUser(record.getUsername(), record.getPassword());
		}
	}

	@Override
	public List<User> getAllUser(Integer page, Integer rows) {
		return userDao.GetAllUser(rows * (page - 1), rows);
	}

	@Override
	public Integer getuUserTotal() {
		return userDao.queryUserTotal();
	}

	@Override
	public boolean updateUserByIds(List<User> record) {
		for (User user : record) {
			if (userDao.updateByPrimaryKeySelective(user) != 1) {
				return false;
			}
		}
		return true;
	}

	@Override
	public boolean deleteuserbyId(Integer[] userIds) {
		for (Integer id : userIds) {
			if (userDao.deleteByPrimaryKey(id) != 1)
				return false;

		}
		return true;
	}

	@Override
	public boolean updateUser(User record) {
		if (userDao.updateByPrimaryKeySelective(record) == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User selectUserById(Integer userid) {
		return userDao.selectUserById(userid);
	}

	@Override
	public boolean authUserDepartMent(int id) {
		Integer i = userDao.authUserDepartMent(id);
		if (i != 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean authUserType(int id) {
		Integer i = userDao.authUserType(id);
		if (i != 0) {
			return false;
		} else {
			return true;
		}
	}

}
