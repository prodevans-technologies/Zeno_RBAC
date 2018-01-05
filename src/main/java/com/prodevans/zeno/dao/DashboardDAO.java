
package com.prodevans.zeno.dao;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.SessionHistory;
import com.prodevans.zeno.pojo.SubscriptionDetails;
import com.prodevans.zeno.pojo.SubscriptionStatus;
import com.prodevans.zeno.pojo.UserDetails;

public interface DashboardDAO {
	public UserDetails getUserDetails(String customer_id) throws XmlRpcException;

	public SubscriptionDetails getSubscriptionDetails(String customer_id) throws XmlRpcException, ParseException;

	public SubscriptionStatus getSubscriptionStatus(int subno) throws XmlRpcException;

	List<SessionHistory> getAllSession(Date startDate, Date endDate, String customerID) throws XmlRpcException;
}
