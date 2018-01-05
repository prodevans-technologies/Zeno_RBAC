package com.prodevans.zeno.pojo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class InvoiceDetails {

	/**
	 * @param invoiceno
	 * @param startdt
	 * @param enddt
	 * @param openingBalance
	 * @param amount
	 * @param content
	 * @param duedt
	 * @param invoicedt
	 * @param pendingamount
	 */
	public InvoiceDetails() {
		this.invoiceno = 0;
		this.startdt = new Date();
		this.enddt = new Date();
		this.openingBalance = 0;
		this.amount = 0;
		this.content = "NA";
		this.duedt = new Date();
		this.invoicedt = new Date();
		this.pendingamount = 0;
	}

	/**
	 * @param invoiceno
	 * @param startdt
	 * @param enddt
	 * @param openingBalance
	 * @param amount
	 * @param content
	 * @param duedt
	 * @param invoicedt
	 * @param pendingamount
	 */
	public InvoiceDetails(int invoiceno, Date startdt, Date enddt, float openingBalance, float amount, String content,
			Date duedt, Date invoicedt, float pendingamount) {
		this.invoiceno = invoiceno;
		this.startdt = startdt;
		this.enddt = enddt;
		this.openingBalance = openingBalance;
		this.amount = amount;
		this.content = content;
		this.duedt = duedt;
		this.invoicedt = invoicedt;
		this.pendingamount = pendingamount;
	}

	private int invoiceno;
	private Date startdt;
	private Date enddt;
	private float openingBalance;
	private float amount;
	private String content;
	private Date duedt;
	private Date invoicedt;
	private float pendingamount;

	public int getInvoiceno() {
		return invoiceno;
	}

	public void setInvoiceno(int invoiceno) {
		this.invoiceno = invoiceno;
	}

	public String getStartdt() {
		return DateFormat.getDateInstance(DateFormat.LONG).format(startdt);
	}

	public void setStartdt(String startdt) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
		Date date = formatter.parse(startdt);
		this.startdt = date;
	}

	public String getEnddt() {
		return DateFormat.getDateInstance(DateFormat.LONG).format(enddt);
	}

	public void setEnddt(String enddt) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
		Date date = formatter.parse(enddt);
		this.enddt = date;
	}

	public float getOpeningBalance() {
		return openingBalance;
	}

	public void setOpeningBalance(float openingBalance) {
		this.openingBalance = openingBalance;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDuedt() {
		return DateFormat.getDateInstance(DateFormat.LONG).format(duedt);
	}

	public void setDuedt(String duedt) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
		Date date = formatter.parse(duedt);
		this.duedt = date;
	}

	public String getInvoicedt() {
		return DateFormat.getDateInstance(DateFormat.LONG).format(invoicedt);
	}

	public void setInvoicedt(String invoicedt) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
		Date date = formatter.parse(invoicedt);
		this.invoicedt = date;
	}

	public float getPendingamount() {
		return pendingamount;
	}

	public void setPendingamount(float pendingamount) {
		this.pendingamount = pendingamount;
	}

	public String getRemainingDays() {
		long diff = (duedt.getTime() - new Date().getTime()) / (24 * 60 * 60 * 1000);
		return diff + "";
	}

}
