package com.prodevans.zeno.dao.impl;

import java.util.HashMap;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.PayBillDAO;
import com.prodevans.zeno.pojo.PayBillDetails;

public class PayBillDAOImpl implements PayBillDAO 
{
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
	public PayBillDetails getAccountDetails(PayBillDetails bill) throws XmlRpcException 
	{	
		Vector params = new Vector();
		params.add(bill.getAccount_id());

		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient.execute(unifyHandler + ".getAccountDetails", params);
		bill.setAccount_no(Integer.parseInt((String)result.get("actno")));
		bill.setMobile((String) result.get("mobileno"));
		bill.setFirst_name((String) result.get("fname"));
		bill.setLast_name((String) result.get("lname"));
		bill.setAddress((String) result.get("address"));
		bill.setCity((String)result.get("cityname"));
		bill.setPin((String)result.get("pin"));
		
		return bill;
	
	}

}
