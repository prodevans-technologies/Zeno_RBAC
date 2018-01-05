package com.prodevans.zeno.pojo;

public class SendMailDetails 
{

	private String name;
	private String mobile;
	private String account_id;
	private String email_id;
	private int account_no;
	private String subject;
	private String message;
	private String time_slot_to_call;
	
	
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
	public String getTime_slot_to_call() {
		return time_slot_to_call;
	}
	public void setTime_slot_to_call(String time_slot_to_call) {
		this.time_slot_to_call = time_slot_to_call;
	}
	@Override
	public String toString() {
		return "SendMailDetails [name=" + name + ", mobile=" + mobile + ", account_id=" + account_id + ", email_id="
				+ email_id + ", account_no=" + account_no + ", subject=" + subject + ", message=" + message
				+ ", time_slot_to_call=" + time_slot_to_call + "]";
	}
	
	
	
	

	
	
}
