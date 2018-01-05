
package com.prodevans.zeno.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.DashboardDAO;
import com.prodevans.zeno.pojo.SessionHistory;
import com.prodevans.zeno.pojo.SubscriptionDetails;
import com.prodevans.zeno.pojo.SubscriptionStatus;
import com.prodevans.zeno.pojo.UserDetails;

public class DashboardDAOImpl implements DashboardDAO {

	private static final Logger logger = LoggerFactory.getLogger(DashboardDAOImpl.class);

	@Autowired
	private String unifyHandler;

	@Autowired
	private XmlRpcClient rpcClient;

	/**
	 * @param unifyHandler
	 *            the unifyHandler to set
	 */
	public void setUnifyHandler(String unifyHandler) {
		this.unifyHandler = unifyHandler;
	}

	/**
	 * @param rpcClient
	 *            the rpcClient to set
	 */
	public void setRpcClient(XmlRpcClient rpcClient) {
		this.rpcClient = rpcClient;
	}

	@Override
	public UserDetails getUserDetails(String customer_id) throws XmlRpcException {
		UserDetails details = new UserDetails();

		Vector<Object> params = new Vector<>();
		params.add(customer_id);
		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient
				.execute(unifyHandler + ".getAccountDetails", params);
		if (result.isEmpty() == false) {
			details.setCustomer_id(result.get("actid").toString());
			details.setEmail(result.get("email").toString());
			details.setFirst_name(result.get("fname").toString());
			details.setLast_name(result.get("lname").toString());
			details.setMobile(result.get("mobileno").toString());
			details.setActno(Integer.parseInt(result.get("actno").toString()));
			return details;
		} else {
			return details;
		}
	}

	@Override
	public SubscriptionDetails getSubscriptionDetails(String customer_id) {
		SubscriptionDetails details = new SubscriptionDetails();
		Vector<Object> params = new Vector<>();
		params.add(customer_id);
		try {
			Object[] res = (Object[]) rpcClient.execute(unifyHandler + ".getSubscriptions", params);

			if (res.length > 0) {
				for (Object o : res) {

					HashMap<String, Object> result = (HashMap<String, Object>) o;
					if (Integer.parseInt(result.get("status").toString()) == 0) {
						details.setRatePlan(result.get("svcdescr").toString());
						details.setStartDate(result.get("startDate").toString());
						details.setStatus(Integer.parseInt(result.get("status").toString()));
						details.setExpirydt(result.get("expirydt").toString());
						details.setSvctype(result.get("svctype").toString());
						details.setSubsno(Integer.parseInt(result.get("subsno").toString()));
						HashMap<String, Object> res_session_detials = getDataUsed(details.getStartDate(), details.getExpiryDate(), customer_id);
						details.setDataUsed((Long) res_session_detials.get("total_bytes"));
                                                details.setIp_address(res_session_detials.get("ip_address").toString());
						details.setFUPLimit(getFUPLimit(details.getRatePlan()));
                                                return details;
					}
				}
			} else {
				return details;
			}
		} catch (Exception ee) {
			logger.error("No subscription found : " + ee.getMessage());
		}
		return details;
	}

	private long getFUPLimit(String rateplan) throws XmlRpcException {
		SubscriptionStatus status = new SubscriptionStatus();
		Vector params = new Vector();
		params.add(rateplan);
		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient
				.execute(unifyHandler + ".getFUPForRatePlan", params);
		if (result.isEmpty() == false) {

			return Long.parseLong(result.get("mbytesin").toString());
		} else {
			return 0;
		}

	}

	private HashMap<String,Object> getDataUsed(Date startDate, Date endDate, String customerID) throws XmlRpcException {
		SubscriptionStatus status = new SubscriptionStatus();
                HashMap<String, Object> result = new HashMap<>();
		long TotalBytes = 0;
                String ip_address = "";
		Vector params = new Vector();
		params.add(startDate);
		params.add(endDate);
		params.add(customerID);
		try {
			Object[] token = (Object[]) rpcClient.execute(unifyHandler + ".getSessionHistory", params);

			for (Object ob : token) {
				HashMap<String, Object> hs = (HashMap<String, Object>) ob;
				TotalBytes += Long.parseLong(hs.get("totalbytes").toString());
                                ip_address = hs.get("ipaddr").toString();
			}
		} catch (Exception ee) {
			logger.error("No Data found : " + ee.getMessage());
		}
                
                result.put("ip_address", ip_address);
                result.put("total_bytes",TotalBytes);
		return result;

	}

	@Override
	public SubscriptionStatus getSubscriptionStatus(int subno) throws XmlRpcException {
		SubscriptionStatus status = new SubscriptionStatus();
		Vector params = new Vector();
		params.add(subno);
		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient
				.execute(unifyHandler + ".getCurrentSubscriptionFUPStatus", params);
		if (result.isEmpty() == false) {
			System.out.println(result.keySet().toString());
			status.setAction(Integer.parseInt(result.get("action").toString()));
			status.setBytesin(result.get("bytesin").toString());
			status.setBytesout(result.get("bytesout").toString());
			status.setSubsno(Integer.parseInt(result.get("subsno").toString()));
			return status;
		} else {
			return null;
		}

	}

	@Override
	public List<SessionHistory> getAllSession(Date startDate, Date endDate, String customerID) {
		List<SessionHistory> allsession = new ArrayList<SessionHistory>();

		Vector params = new Vector();
		params.add(startDate);
		params.add(endDate);
		params.add(customerID);

		try {
			Object[] token = (Object[]) rpcClient.execute(unifyHandler + ".getSessionHistory", params);

			double TotalBytes = 0;
			double download = 0;
			double upload = 0;
			for (Object ob : token) {
				HashMap<String, Object> hs = (HashMap<String, Object>) ob;
				SessionHistory hsHistory = new SessionHistory();
				upload = Long.parseLong(hs.get("bytesin").toString());
				hsHistory.setBytesin(upload);
				download = Long.parseLong(hs.get("bytesout").toString());
				hsHistory.setBytesout(download);
				hsHistory.setDuration(Long.parseLong(hs.get("duration").toString()));

				TotalBytes = Long.parseLong(hs.get("totalbytes").toString());
				hsHistory.setTotalbytes(TotalBytes);
				hsHistory.setDate(hs.get("start").toString());
				allsession.add(hsHistory);
			}
		} catch (Exception ee) {
			logger.error("No session found : " + ee.getMessage());
		}
		return allsession;

	}

}