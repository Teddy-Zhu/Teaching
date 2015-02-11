package com.jcos.teaching.core.service;

import java.util.List;

import com.jcos.teaching.core.model.User;

public interface UserService {

    public List<User> selectUserSelective(User record);

    public Integer selectUserByUserName(String userName);

    public Integer registerUser(User record);

    public User authLoginUser(User record);
    
	List<User> getAllUser(Integer page, Integer rows);

	Integer getuUserTotal();

	boolean updateUserByIds(List<User> record);

	boolean deleteuserbyId(Integer[] userIds);

	boolean updateUser(User record);

	Integer selectUserByUserNameAndId(String userName, int userId);

	User selectUserById(Integer userid);
}
