package com.prodevans.zeno.dao.impl;

import java.util.HashMap;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.UserLoginDAO;
import com.prodevans.zeno.pojo.SessionDetails;

public class UserInfoDAOImpl implements UserLoginDAO {
	@Autowired
	private String unifyHandler;

	@Autowired
	private XmlRpcClient rpcClient;

	public void setUnifyHandler(String unifyHandler) {
		this.unifyHandler = unifyHandler;
	}

	public void setRpcClient(XmlRpcClient rpcClient) {
		this.rpcClient = rpcClient;
	}

	@Override
	public SessionDetails loginCheck(String customer_id, String password) throws XmlRpcException {
		SessionDetails userSessionDetails = new SessionDetails();
		Vector params = new Vector();
		params.add(customer_id);

		

		try
		{
			HashMap<String, Object> result = (HashMap<String, Object>) rpcClient
					.execute(unifyHandler + ".getAccountDetails", params);
			
			if (result.get("password").toString().equals(password) && result.get("actid").toString().equals(customer_id)) {
				Vector params1 = new Vector();
				params1.add(Integer.parseInt(result.get("actno").toString()));
				Object o = rpcClient.execute(unifyHandler + ".getTotalPendingInvoiceValue", params1);
				double pendingAmount = (Double) o;
	
				userSessionDetails.setActid(result.get("actid").toString());
				userSessionDetails.setActno(Integer.parseInt(result.get("actno").toString()));
				userSessionDetails.setActname(result.get("fname").toString());
				userSessionDetails.setDomid(result.get("domid").toString());
				userSessionDetails.setDomno(Integer.parseInt(result.get("domno").toString()));
				userSessionDetails.setEmail(result.get("email").toString());
				userSessionDetails.setMobileno(result.get("mobileno").toString());
				userSessionDetails.setPassword(result.get("password").toString());
				userSessionDetails.setFirst_name(result.get("fname").toString());
	
				userSessionDetails.setLast_name(result.get("lname").toString());
				userSessionDetails.setAddress(result.get("address").toString());
				userSessionDetails.setPin(result.get("pin").toString());
				userSessionDetails.setCityname(result.get("cityname").toString());
				userSessionDetails.setCountryname(result.get("countryname").toString());
	
				userSessionDetails.setPendingAmount(pendingAmount);
	
				userSessionDetails.setResult(true);
				return userSessionDetails;
			} 
			else 
			{
				if(result.get("actid").toString().equals(customer_id))
				{
					userSessionDetails.setResultMessage("Your password is incorrect");
				}
				else
				{
					userSessionDetails.setResultMessage("Your One8 ID is incorrect");
				}
				
				userSessionDetails.setResult(false);
				return userSessionDetails;
			}
			
		}
		catch(Exception e)
		{
			userSessionDetails.setResultMessage("Your One8 ID is incorrect");
			return userSessionDetails;
		}
			
	}

	@Override
	public SessionDetails getDetails(int customer_id) throws XmlRpcException {
		SessionDetails userSessionDetails = new SessionDetails();
		Vector params = new Vector();
		params.add(customer_id);

		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient
				.execute(unifyHandler + ".getAccountDetails", params);

		if (result.get("actno").toString().equals(customer_id + "")) {
			Vector params1 = new Vector();
			params1.add(Integer.parseInt(result.get("actno").toString()));
			Object o = rpcClient.execute(unifyHandler + ".getTotalPendingInvoiceValue", params1);
			double pendingAmount = (Double) o;

			userSessionDetails.setActid(result.get("actid").toString());
			userSessionDetails.setActno(Integer.parseInt(result.get("actno").toString()));
			userSessionDetails.setActname(result.get("fname").toString());
			userSessionDetails.setDomid(result.get("domid").toString());
			userSessionDetails.setDomno(Integer.parseInt(result.get("domno").toString()));
			userSessionDetails.setEmail(result.get("email").toString());
			userSessionDetails.setMobileno(result.get("mobileno").toString());
			userSessionDetails.setPassword(result.get("password").toString());
			userSessionDetails.setFirst_name(result.get("fname").toString());

			userSessionDetails.setLast_name(result.get("lname").toString());
			userSessionDetails.setAddress(result.get("address").toString());
			userSessionDetails.setPin(result.get("pin").toString());
			userSessionDetails.setCityname(result.get("cityname").toString());
			userSessionDetails.setCountryname(result.get("countryname").toString());

			userSessionDetails.setPendingAmount(pendingAmount);

			userSessionDetails.setResult(true);
			return userSessionDetails;
		} else {
			userSessionDetails.setResult(false);
			return userSessionDetails;
		}
	}
}
