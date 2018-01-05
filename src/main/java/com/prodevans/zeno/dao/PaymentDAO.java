package com.prodevans.zeno.dao;

import java.net.MalformedURLException;

import org.apache.xmlrpc.XmlRpcException;

public interface PaymentDAO 
{
	public double getPendingAmount(int actno) throws XmlRpcException, MalformedURLException;
}
