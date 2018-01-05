package com.prodevans.zeno.dao;

import java.util.HashMap;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.PaymentDetails;

public interface PaymentResponseDAO 
{
	public PaymentDetails getAllPaymentTransactionDetails(PaymentDetails paymentDetails) throws XmlRpcException;
	public PaymentDetails setAllPaymentTransactionDetails(HashMap<String, String> responseFromCCAvenue);
}
