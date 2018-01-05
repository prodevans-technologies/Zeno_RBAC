package com.prodevans.zeno.pojo;

import java.util.Date;

public class SessionDetails {

	private int actno;
	private String actid;
	private String actname;
	private String password;
	private int domno;
	private String domid;
	private String mobileno;
	private String email;
	private boolean result;
	private String first_name;

	private String last_name;
	private String address;
	private String pin;
	private String cityname;
	private String countryname;
	private double pendingAmount;

	private String amount;
	private boolean getClosed;
	private Date fromDate ;
	private Date toDate;
	
	private String resultMessage;
	
	
	

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}

	public boolean isGetClosed() {
		return getClosed;
	}

	public void setGetClosed(boolean getClosed) {
		this.getClosed = getClosed;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
        
        private String ip_address;
        
	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public boolean getResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public int getActno() {
		return actno;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SessionDetails [actno=" + actno + ", actid=" + actid + ", actname=" + actname + ", password=" + password
				+ ", domno=" + domno + ", domid=" + domid + ", mobileno=" + mobileno + ", email=" + email + ", result="
				+ result + ", first_name=" + first_name + ", last_name=" + last_name + ", address=" + address + ", pin="
				+ pin + ", cityname=" + cityname + ", countryname=" + countryname + ", pendingAmount=" + pendingAmount
				+ "]";
	}

	public void setActno(int actno) {
		this.actno = actno;
	}

	public String getActid() {
		return actid;
	}

	public void setActid(String actid) {
		this.actid = actid;
	}

	public String getActname() {
		return actname;
	}

	public void setActname(String actname) {
		this.actname = actname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDomno() {
		return domno;
	}

	public void setDomno(int domno) {
		this.domno = domno;
	}

	public String getDomid() {
		return domid;
	}

	public void setDomid(String domid) {
		this.domid = domid;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public String getCountryname() {
		return countryname;
	}

	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}

	public double getPendingAmount() {
		return pendingAmount;
	}

	public void setPendingAmount(double pendingAmount) {
		this.pendingAmount = pendingAmount;
	}

    /**
     * @return the ip_address
     */
    public String getIp_address() {
        return ip_address;
    }

    /**
     * @param ip_address the ip_address to set
     */
    public void setIp_address(String ip_address) {
        this.ip_address = ip_address;
    }

}
