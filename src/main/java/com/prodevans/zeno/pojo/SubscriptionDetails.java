
package com.prodevans.zeno.pojo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SubscriptionDetails {
	private String ratePlan;
	private Date startDate;
	private int status;
	private Date expirydt;
	private String svctype;
	private int subsno;
	private long FUPLimit;
	private long dataUsed;
        private String ip_address;
        
	/**
	 * @return the fUPLimit
	 */
	public long getFUPLimit() {
		return FUPLimit;
	}

	/**
	 * @param fUPLimit
	 *            the fUPLimit to set
	 */
	public void setFUPLimit(long fUPLimit) {
		FUPLimit = (fUPLimit / 1024);
	}

	public double getDataPercent() {
		// long vv = (dataUsed / FUPLimit);
		double mul = dataUsed * 100;

		double div = mul / FUPLimit;
		System.out.println("Division result : " + div);
		System.out.println("multiplication result : " + mul);
		return div;
	}

	/**
	 * @return the dataUsed
	 */
	public long getDataUsed() {
		return dataUsed;
	}

	/**
	 * @param dataUsed
	 *            the dataUsed to set
	 */
	public void setDataUsed(long dataUsed) {
		this.dataUsed = (dataUsed / (1024 * 1024 * 1024));
	}

	/**
	 * @param expirydt
	 *            the expirydt to set
	 */
	public void setExpirydt(Date expirydt) {
		this.expirydt = expirydt;
	}

	/**
	 * 
	 */
	public SubscriptionDetails() {
		this.ratePlan = "N.A.";
		this.startDate = new Date();
		this.status = 0;
		this.expirydt = new Date();
		this.svctype = "N.A.";
		this.subsno = 0;
	}

	/**
	 * @param ratePlan
	 * @param startDate
	 * @param status
	 * @param expirydt
	 * @param svctype
	 * @param subsno
	 * @param planno
	 */
	public SubscriptionDetails(String ratePlan, Date startDate, int status, Date expirydt, String svctype, int subsno) {
		this.ratePlan = ratePlan;
		this.startDate = startDate;
		this.status = status;
		this.expirydt = expirydt;
		this.svctype = svctype;
		this.subsno = subsno;

	}

	/**
	 * @return the ratePlan
	 */
	public String getRatePlan() {
		return ratePlan;
	}

	/**
	 * @param ratePlan
	 *            the ratePlan to set
	 */
	public void setRatePlan(String ratePlan) {
		this.ratePlan = ratePlan;
	}

	/**
	 * @return the startDate
	 */
	public Date getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate
	 *            the startDate to set
	 * @throws ParseException
	 */
	public void setStartDate(String startDate) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(startDate);
		this.startDate = date;
	}

	/**
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(int status) {

		this.status = status;
	}

	/**
	 * @return the expirydt
	 */
	public String getExpirydt() {

		return DateFormat.getDateInstance(DateFormat.LONG).format(expirydt);
	}

	public String getStartdt() {

		return DateFormat.getDateInstance(DateFormat.LONG).format(startDate);
	}

	public Date getExpiryDate() {

		return expirydt;
	}

	public String getRemainingDays() {
		long diff = (expirydt.getTime() - new Date().getTime()) / (24 * 60 * 60 * 1000);
		return diff + "";
	}

	/**
	 * @param expirydt
	 *            the expirydt to set
	 * @throws ParseException
	 */
	public void setExpirydt(String expirydt) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(expirydt);
		// this.expirydt = formatter.format(date);
		// this.expirydt = DateFormat.getDateInstance(DateFormat.LONG).format(date);

		this.expirydt = date;
		// System.out.println("expiry Date : " + expirydt);
	}

	/**
	 * @return the svctype
	 */
	public String getSvctype() {
		return svctype;
	}

	/**
	 * @param svctype
	 *            the svctype to set
	 */
	public void setSvctype(String svctype) {
		this.svctype = svctype;
	}

	/**
	 * @return the subsno
	 */
	public int getSubsno() {
		return subsno;
	}

	/**
	 * @param subsno
	 *            the subsno to set
	 */
	public void setSubsno(int subsno) {
		this.subsno = subsno;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SubscriptionDetails [ratePlan=" + ratePlan + ", startDate=" + startDate + ", status=" + status
				+ ", expirydt=" + expirydt + ", svctype=" + svctype + ", subsno=" + subsno + ", FUPLimit=" + FUPLimit
				+ ", dataUsed=" + dataUsed + ", percentdata=" + getDataPercent() + "]";
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
