package com.prodevans.zeno.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.prodevans.zeno.pojo.UserInfo;

public class UserInfoMapper implements RowMapper<UserInfo> {

	@Override
	public UserInfo mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		UserInfo info = new UserInfo();
		info.setCustomer_id(rs.getString("customer_id"));
		info.setPassword(rs.getString("password"));
		return info;
	}

}
