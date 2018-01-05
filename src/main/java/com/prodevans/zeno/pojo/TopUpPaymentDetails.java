package com.prodevans.zeno.pojo;

import java.util.Date;

public class TopUpPaymentDetails 
{

	private int actno;
	private double trans_amount;
	private String trans_type;
	private Date trans_date;
	private String currency;
	private int instrumentid;
	private String instrument_detail;
	private String trans_descr;
	private int Transaction_id;
	
	
	public TopUpPaymentDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TopUpPaymentDetails(int actno, double trans_amount, String trans_type, Date trans_date, String currency,
			int instrumentid, String instrument_detail, String trans_descr) {
		super();
		this.actno = actno;
		this.trans_amount = trans_amount;
		this.trans_type = trans_type;
		this.trans_date = trans_date;
		this.currency = currency;
		this.instrumentid = instrumentid;
		this.instrument_detail = instrument_detail;
		this.trans_descr = trans_descr;
	}
	public int getActno() {
		return actno;
	}
	public void setActno(int actno) {
		this.actno = actno;
	}
	public double getTrans_amount() {
		return trans_amount;
	}
	public void setTrans_amount(double trans_amount) {
		this.trans_amount = trans_amount;
	}
	public String getTrans_type() {
		return trans_type;
	}
	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}
	public Date getTrans_date() {
		return trans_date;
	}
	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public int getInstrumentid() {
		return instrumentid;
	}
	public void setInstrumentid(int instrumentid) {
		this.instrumentid = instrumentid;
	}
	public String getInstrument_detail() {
		return instrument_detail;
	}
	public void setInstrument_detail(String instrument_detail) {
		this.instrument_detail = instrument_detail;
	}
	public String getTrans_descr() {
		return trans_descr;
	}
	public void setTrans_descr(String trans_descr) {
		this.trans_descr = trans_descr;
	}
	public int getTransaction_id() {
		return Transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		Transaction_id = transaction_id;
	}
	
	
	
	
	
}
