package com.prodevans.zeno.dao;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.PayBillDetails;

public interface PayBillDAO 
{
	public PayBillDetails getAccountDetails(PayBillDetails bill) throws XmlRpcException;
}
