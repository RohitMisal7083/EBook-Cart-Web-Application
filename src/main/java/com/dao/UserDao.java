package com.dao;

import com.entity.User;

public interface UserDao {

	public boolean userRegister(User us);
	
	public User login(String email,String password);
	
	public boolean checkPassword(int id,String pass);
	
	public boolean updateProfile(User us);
	
	public boolean checkuser(String em);
}
