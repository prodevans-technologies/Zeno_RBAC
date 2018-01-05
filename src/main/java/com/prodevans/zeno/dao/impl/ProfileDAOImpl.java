package com.prodevans.zeno.dao.impl;

import java.util.HashMap;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.ProfileDAO;
import com.prodevans.zeno.pojo.ChangePassword;
import com.prodevans.zeno.pojo.ProfileDetails;
import com.prodevans.zeno.pojo.SendMailDetails;
import com.prodevans.zeno.pojo.SessionDetails;

public class ProfileDAOImpl implements ProfileDAO {

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
	public ProfileDetails getProfile(String actid) throws Exception {
		ProfileDetails details = new ProfileDetails();

		Vector<Object> params = new Vector<>();
		params.add(actid);
		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient
				.execute(unifyHandler + ".getAccountDetails", params);
		if (result.isEmpty() == false) {
			details.setActid(result.get("actid").toString());
			details.setFname(result.get("fname").toString());
			details.setLname(result.get("lname").toString());
			details.setEmail(result.get("email").toString());
			details.setMobileno(result.get("mobileno").toString());
			details.setActcat(result.get("actcat").toString());
			details.setAddress(result.get("address").toString());
			details.setCityname(result.get("cityname").toString());
			details.setPassword(result.get("password").toString());
			//System.out.println(details.toString());
			return details;
		} else {
			return null;
		}
	}

	@Override
	public boolean updatePassword(String actid, String password) throws Exception {
		Vector<Object> params = new Vector<>();
		params.add(actid);
		params.add(password);
		int result = (int) rpcClient.execute(unifyHandler + ".changeAccountPassword", params);
		if (result == 0)
			return true;
		else
			return false;

	}
	@Override
	public Boolean sentMailChangePassword(SessionDetails user) throws XmlRpcException 
	{
		
		Vector params = new Vector();
		String content = "Hi "+user.getFirst_name()+",\n\nYour account password for account id " +user.getActid()+" has been changed successfully. Log back in with your new password now. If you haven’t initiated this change, please call us at 080-30323000 immediately.\n\nThanks & Regards \nOne8 support ";
		params.add(content);
		params.add("Change password");
		//params.add(""+feedback.getEmail_id());
		//System.out.println("mail id "+user.getEmail());
		//System.out.println("mail id "+user.getActid());
		//System.out.println("mail id "+user.getPassword());
		params.add("anand.prodevans@gmail.com");
		params.add(1);
		
		Boolean mailResult = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params);
		
		System.out.println("mail send successfully");
		
		return mailResult;
	}

	

}
