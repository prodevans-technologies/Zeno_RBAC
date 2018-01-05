package com.prodevans.zeno.pojo;

public class PayBillDetails 
{

	private String account_id;
	private String email_id;
	private double amount;
	
	
	private int account_no;
	private String mobile;
	private String first_name;
	private String last_name;
	private String address;
	private String city;
	private String pin;
	
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

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getAccount_no() {
		return account_no;
	}

	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	@Override
	public String toString() {
		return "PayBillDetails [account_id=" + account_id + ", email_id=" + email_id + ", amount=" + amount
				+ ", account_no=" + account_no + ", mobile=" + mobile + ", first_name=" + first_name + ", last_name="
				+ last_name + ", address=" + address + ", city=" + city + ", pin=" + pin + "]";
	}
	
	
	
	
}
