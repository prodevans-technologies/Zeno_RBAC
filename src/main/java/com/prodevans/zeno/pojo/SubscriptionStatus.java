package com.prodevans.zeno.pojo;

public class SubscriptionStatus {
	private int subsno;
	private int action;
	private String bytesin;
	private String bytesout;

	/**
	 * 
	 */
	public SubscriptionStatus() {
	}

	/**
	 * @param subsno
	 * @param action
	 * @param bytesin
	 * @param bytesout
	 */
	public SubscriptionStatus(int subsno, int action, String bytesin, String bytesout) {
		this.subsno = subsno;
		this.action = action;
		this.bytesin = bytesin;
		this.bytesout = bytesout;
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

	/**
	 * @return the action
	 */
	public int getAction() {
		return action;
	}

	/**
	 * @param action
	 *            the action to set
	 */
	public void setAction(int action) {
		this.action = action;
	}

	/**
	 * @return the bytesin
	 */
	public String getBytesin() {
		return bytesin;
	}

	/**
	 * @param bytesin
	 *            the bytesin to set
	 */
	public void setBytesin(String bytesin) {
		this.bytesin = bytesin;
	}

	/**
	 * @return the bytesout
	 */
	public String getBytesout() {
		return bytesout;
	}

	/**
	 * @param bytesout
	 *            the bytesout to set
	 */
	public void setBytesout(String bytesout) {
		this.bytesout = bytesout;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "SubscriptionStatus [subsno=" + subsno + ", action=" + action + ", bytesin=" + bytesin + ", bytesout="
				+ bytesout + "]";
	}

}
