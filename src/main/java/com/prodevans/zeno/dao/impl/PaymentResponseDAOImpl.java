package com.prodevans.zeno.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.PaymentResponseDAO;
import com.prodevans.zeno.pojo.PaymentDetails;

public class PaymentResponseDAOImpl implements PaymentResponseDAO 
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
	public PaymentDetails getAllPaymentTransactionDetails(PaymentDetails paymentDetails) throws XmlRpcException 
	{
		Vector<Object> params = new Vector<>();
		params.add(paymentDetails.getActno());
		params.add(paymentDetails.getTrans_amount());
		params.add(paymentDetails.getTrans_type());
		params.add(paymentDetails.getTrans_date());
		params.add(paymentDetails.getCurrency());
		params.add(paymentDetails.getInstrumentid());
		params.add(paymentDetails.getInstrument_detail());
		params.add(paymentDetails.getTrans_descr());
		
		Object o=(Object) rpcClient.execute(unifyHandler+".addTransaction",params);
		int Transaction_id=(int)o;
		paymentDetails.setTransaction_id(Transaction_id);
		
		return paymentDetails;
	}
	
	@Override
	public PaymentDetails setAllPaymentTransactionDetails(HashMap<String, String> responseFromCCAvenue) 
	{
		PaymentDetails paymentDetails=new PaymentDetails();
		paymentDetails.setActno(22);
		paymentDetails.setTrans_amount(Double.parseDouble(responseFromCCAvenue.get("amount")));
		paymentDetails.setTrans_type("C");
		paymentDetails.setTrans_date(new Date());
		paymentDetails.setCurrency(responseFromCCAvenue.get("currency"));
		paymentDetails.setInstrumentid(3);
		paymentDetails.setInstrument_detail("Credit Card");
		paymentDetails.setTrans_descr("Transaction Successfull..");
		
		return paymentDetails;
	}

}
