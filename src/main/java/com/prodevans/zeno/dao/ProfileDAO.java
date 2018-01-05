package com.prodevans.zeno.dao;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.ProfileDetails;
import com.prodevans.zeno.pojo.SessionDetails;

public interface ProfileDAO {
	ProfileDetails getProfile(String actid) throws Exception;

	public boolean updatePassword(String actid, String password) throws Exception;
	public Boolean sentMailChangePassword(SessionDetails user) throws XmlRpcException;

}
