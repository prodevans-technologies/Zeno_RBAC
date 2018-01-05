package com.prodevans.zeno.dao.impl;

import java.util.HashMap;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.SendMailDAO;
import com.prodevans.zeno.pojo.SendMailDetails;
import com.prodevans.zeno.pojo.ServiceRequest;
import com.prodevans.zeno.pojo.SessionDetails;

public class SendMailDAOImpl implements SendMailDAO 
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
	public Boolean sentMailFeedback(SendMailDetails feedback,SessionDetails email) throws XmlRpcException 
	{
		Vector params = new Vector();
		params.add(feedback.getAccount_id());
		
		HashMap<String, Object> result = (HashMap<String, Object>) rpcClient.execute(unifyHandler + ".getAccountDetails", params);
		feedback.setAccount_no(Integer.parseInt((String)result.get("actno")));
		feedback.setEmail_id((String)result.get("email"));		
		
		Vector params1 = new Vector();
		//String Complete="Concated message that might have HTML code"+feedback.getMessage();
		String content = "Name: " + feedback.getName() + "\nMobile: " + feedback.getMobile() + "\nActno: " + feedback.getAccount_id() + "\nSubject: " + feedback.getSubject()+ "\nComment:" + feedback.getMessage();
		params1.add(content);
		params1.add("FeedBack");
		params1.add("siddu.prodevans@gmail.com");
		params1.add(1);
		
		Boolean mailResult = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params1);
		
		System.out.println("mail send successfully");
		
		Vector params2 = new Vector();
		
		//String content1 = "Name: " + feedback.getName() + "\nMobile: " + feedback.getMobile() + "\nActno: " + feedback.getAccount_id() + "\nSubject: " + feedback.getSubject()+ "\nComment:" + feedback.getMessage();
		String content1= "Hi "+ feedback.getName()+"\n\nYour feedback is valuable to us. Thank you for taking the time to help make nuron the best it can be.\n\nThank you\nTeam nuron";
		params2.add(content1);
		params2.add("FeedBack Acknowldgement");
		System.out.println("email"+feedback.getEmail_id());
		params2.add("siddu.prodevans@gmail.com");
		//params2.add(feedback.getEmail_id());
		params2.add(1);
		
		Boolean mailResult1 = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params2);
		
		return mailResult1;
	}
	
	@Override
	public Boolean sentMailContactUs(SendMailDetails feedback) throws XmlRpcException 
	{
		Vector params = new Vector();
		String content = "Name: " + feedback.getName() + "\nEmail: " + feedback.getEmail_id() + "\nSubject: " + feedback.getSubject() + "\nMessage: " + feedback.getMessage();
		params.add(content);
		params.add("Contact Us");
		params.add("anand.prodevans@gmail.com");
		params.add(1);
		
		Boolean mailResult = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params);
		
		System.out.println("mail send successfully");
		
		Vector params1 = new Vector();
		
		//String content1 = "Name:" + feedback.getName() + "\nEmail: " + feedback.getEmail_id() + "\nSubject: " + feedback.getSubject() + "\nMessage: " + feedback.getMessage();
		String content1 = "Hi "+feedback.getName()+",\n\nThank you for contacting us. Our customer care executive will get in touch with you shortly.\n\nTeam nuron";
		params1.add(content1);
		params1.add("Contact Us Acknowldgement");
		params1.add("anand.prodevans@gmail.com");
		//params1.add(feedback.getEmail_id());
		params1.add(1);
		
		Boolean mailResult1 = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params1);
		
		return mailResult1;
	}
	@Override
	public Boolean sentMailServiceRequest(ServiceRequest serviceRequest) throws XmlRpcException 
	{
		String requestData="";
		String complaintData="";
		String mailContent="";
		
		for(String data : serviceRequest.getRequestCheckboxArray()) 
		{
			requestData=requestData+""+data+"\n";
		}
		for(String data : serviceRequest.getComplaintCheckboxArray()) 
		{
			complaintData=complaintData+""+data+"\n";
		}
		
		
		
		mailContent="Name : "+serviceRequest.getName()+" \nMobile No. : "+serviceRequest.getMobile()+" \nTime Slot to call : "+serviceRequest.getTime_slot_to_call().toString()+" \nRequest : "+requestData+" \nComplaint : "+complaintData+" \nTell Us More : "+serviceRequest.getMessage();
	
		System.out.println("Content : "+mailContent);
		
		Vector params = new Vector();
		params.add(mailContent);
		params.add("Service Request");
		params.add("anand.prodevans@gmail.com");
		params.add(1);
		
		Boolean mailResult = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params);
		
		System.out.println("mail send successfully");
		

		Vector params1 = new Vector();
		params1.add("Hi "+serviceRequest.getName()+",\n\nWe have received your service request. You ticket no. is XXXXXXX and our customer care executive will get in touch with you shortly.\n\nTeam nuron");
		params1.add("Service Request");
		params1.add("anand.prodevans@gmail.com");
		//params1.add(serviceRequest.getEmail_id());
		System.out.println("mail"+serviceRequest.getEmail_id());
		params1.add(1);
		
		Boolean mailResult1 = (Boolean) rpcClient.execute(unifyHandler + ".sendMail", params1);
		
		return mailResult1;
		
	}
	

}
