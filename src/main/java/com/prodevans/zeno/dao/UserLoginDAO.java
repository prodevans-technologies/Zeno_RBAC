package com.prodevans.zeno.dao;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.SessionDetails;

public interface UserLoginDAO {
	SessionDetails loginCheck(String customer_id, String password) throws XmlRpcException;

	SessionDetails getDetails(int customer_id) throws XmlRpcException;
}
