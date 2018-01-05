package com.prodevans.zeno.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SessionHistory implements Comparable<SessionHistory> {
	/**
	 * @param totalbytes
	 * @param duration
	 * @param bytesin
	 * @param bytesout
	 * @param date
	 */
	public SessionHistory(long totalbytes, long duration, long bytesin, long bytesout, Date date) {
		this.totalbytes = totalbytes;
		this.duration = duration;
		this.bytesin = bytesin;
		this.bytesout = bytesout;
		this.date = date;
	}

	private double totalbytes;
	private double duration;
	private double bytesin;
	private double bytesout;
	private Date date;

	/**
	 * @param totalbytes
	 * @param duration
	 * @param bytesin
	 * @param bytesout
	 */
	public SessionHistory(Date dt) {
		this.totalbytes = 0;
		this.duration = 0;
		this.bytesin = 0;
		this.bytesout = 0;
		this.date = dt;
	}

	/**
	 * 
	 */
	public SessionHistory() {
		this.totalbytes = 0;
		this.duration = 0;
		this.bytesin = 0;
		this.bytesout = 0;
	}

	/**
	 * @return the totalbytes
	 */
	public double getTotalbytes() {
		return totalbytes;
	}

	/**
	 * @param totalbytes
	 *            the totalbytes to set
	 */
	public void setTotalbytes(double totalbytes) {
		this.totalbytes = (totalbytes / (1024 * 1024 * 1024));
	}

	public void setTotalbytesMB(long totalbytes) {
		this.totalbytes = totalbytes;
	}

	/**
	 * @return the duration
	 */
	public double getDuration() {
		return duration;
	}

	/**
	 * @param duration
	 *            the duration to set
	 */
	public void setDuration(long duration) {
		this.duration = duration;
	}

	/**
	 * @return the bytesin
	 */
	public double getBytesin() {
		return bytesin;
	}

	/**
	 * @param bytesin
	 *            the bytesin to set
	 */
	public void setBytesin(double bytesin) {
		this.bytesin = (bytesin / (1024 * 1024 * 1024));
	}

	public void setBytesinMB(long bytesin) {
		this.bytesin = bytesin;
	}

	/**
	 * @return the bytesout
	 */
	public double getBytesout() {
		return bytesout;
	}

	/**
	 * @param bytesout
	 *            the bytesout to set
	 */
	public void setBytesout(double bytesout) {
		this.bytesout = (bytesout / (1024 * 1024 * 1024));
	}

	public void setBytesoutMB(long bytesout) {
		this.bytesout = bytesout;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SessionHistory [totalbytes=" + totalbytes + ", duration=" + duration + ", bytesin=" + bytesin
				+ ", bytesout=" + bytesout + ", date=" + date + "]";
	}

	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @return the date
	 */
	public String getFormattedDate() {
		SimpleDateFormat sm = new SimpleDateFormat("dd MMM");
		return sm.format(date);
	}

	/**
	 * @param date
	 *            the date to set
	 * @throws ParseException
	 */
	public void setDate(String date) throws ParseException {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = sm.parse(date);
		this.date = dt;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		Date dt = (Date) obj;
		return date.equals(dt);
	}

	@Override
	public int compareTo(SessionHistory o) {
		if (date.before(o.getDate()))
			return -1;
		else
			return 1;
	}

	public void add(SessionHistory sessionHistory) {
		this.bytesin += sessionHistory.getBytesin();
		this.bytesout += sessionHistory.getBytesout();
		this.totalbytes += sessionHistory.getTotalbytes(); 
	}

}
