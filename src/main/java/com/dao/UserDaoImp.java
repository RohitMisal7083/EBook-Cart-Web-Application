package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDaoImp implements UserDao {

	private Connection conn;

	public UserDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

// method to insert
	@Override
	public boolean userRegister(User us) {

		boolean f = false;

		try {
			String sql = "insert into users(name,email,mobileno,password) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobileno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public User login(String email, String password) {

		User us = null;

		try {

			String sql = "select * from users where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setMobileno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return us;
	}

	@Override
	public boolean checkPassword(int id, String pass) {
		boolean f = false;

		try {

			String sql = "select * from users where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean updateProfile(User us) {

		boolean f = false;

		try {
			String sql = "update users set name=?,email=?,mobileno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getMobileno());
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public boolean checkuser(String em) {

		boolean f = true;

		try {
			String sql = "select * from users where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			

			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				
				f=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

}
