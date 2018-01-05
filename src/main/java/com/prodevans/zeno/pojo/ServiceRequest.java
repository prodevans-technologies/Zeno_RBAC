package com.prodevans.zeno.pojo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ServiceRequest {
	private String name;
	private String mobile;
	private String account_id;
	private String email_id;
	private int account_no;
	private String subject;
	private String message;
	private String time_slot;
	
	private String[] requestCheckboxArray;
	private String[] complaintCheckboxArray;
	
	List<String> time_slot_to_call = new ArrayList<String>();
	
	
	
	public List<String> getTime_slot_to_call() {
		return time_slot_to_call;
	}
	public void setTime_slot_to_call(List<String> time_slot_to_call) {
		this.time_slot_to_call = time_slot_to_call;
	}
	public String getTime_slot() {
		return time_slot;
	}
	public void setTime_slot(String time_slot) {
		this.time_slot = time_slot;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public int getAccount_no() {
		return account_no;
	}
	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String[] getRequestCheckboxArray() {
		return requestCheckboxArray;
	}
	public void setRequestCheckboxArray(String[] requestCheckboxArray) {
		this.requestCheckboxArray = requestCheckboxArray;
	}
	public String[] getComplaintCheckboxArray() {
		return complaintCheckboxArray;
	}
	public void setComplaintCheckboxArray(String[] complaintCheckboxArray) {
		this.complaintCheckboxArray = complaintCheckboxArray;
	}
		
	@Override
	public String toString() {
		return "ServiceRequest [name=" + name + ", mobile=" + mobile + ", account_id=" + account_id + ", email_id="
				+ email_id + ", account_no=" + account_no + ", subject=" + subject + ", message=" + message
				+ ", time_slot=" + time_slot + ", requestCheckboxArray=" + Arrays.toString(requestCheckboxArray)
				+ ", complaintCheckboxArray=" + Arrays.toString(complaintCheckboxArray) + ", time_slot_to_call="
				+ time_slot_to_call + "]";
	}
	
	
	
	
	
	
}
