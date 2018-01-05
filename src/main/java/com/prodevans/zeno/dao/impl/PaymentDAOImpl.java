package com.prodevans.zeno.dao.impl;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.apache.xmlrpc.client.XmlRpcClientConfigImpl;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.PaymentDAO;

public class PaymentDAOImpl implements PaymentDAO
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
	public double getPendingAmount(int actno) throws XmlRpcException
	{
		Vector<Object> params = new Vector<>();
		params.add(actno);
		System.out.println("Actno : "+actno);
		Object o=(Object) rpcClient.execute(unifyHandler+".getTotalPendingInvoiceValue",params);
		double pendingAmount=(Double)o;
		System.out.println("amount from impl : "+pendingAmount);
		return pendingAmount;
		//return 0;
	}

}
