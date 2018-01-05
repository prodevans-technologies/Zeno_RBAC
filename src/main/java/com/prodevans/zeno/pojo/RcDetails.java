package com.prodevans.zeno.pojo;

import java.util.Date;

public class RcDetails {

	private String actid;
	private boolean getClosed;
	private Date fromDate ;
	private Date toDate;
	private String amount;
	private String brcdesc;
	
	
	
	
	public String getBrcdesc() {
		return brcdesc;
	}
	public void setBrcdesc(String brcdesc) {
		this.brcdesc = brcdesc;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getActid() {
		return actid;
	}
	public void setActid(String actid) {
		this.actid = actid;
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
	@Override
	public String toString() {
		return "RcDetails [actid=" + actid + ", getClosed=" + getClosed + ", fromDate=" + fromDate + ", toDate="
				+ toDate + ", amount=" + amount + ", brcdesc=" + brcdesc + "]";
	}
	
	
}
