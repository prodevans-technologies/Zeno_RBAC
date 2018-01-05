package com.prodevans.zeno.dao;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.SendMailDetails;
import com.prodevans.zeno.pojo.ServiceRequest;
import com.prodevans.zeno.pojo.SessionDetails;

public interface SendMailDAO 
{
	public Boolean sentMailFeedback(SendMailDetails feedback, SessionDetails email) throws XmlRpcException;
	public Boolean sentMailContactUs(SendMailDetails feedback) throws XmlRpcException;
	public Boolean sentMailServiceRequest(ServiceRequest serviceRequest) throws XmlRpcException;
	
}
