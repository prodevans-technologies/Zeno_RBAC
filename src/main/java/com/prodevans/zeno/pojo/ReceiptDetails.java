package com.prodevans.zeno.pojo;

public class ReceiptDetails {
	
	private int trans_id;

	/**
	 * @return the trans_id
	 */
	public int getTrans_id() {
		return trans_id;
	}

	/**
	 * @param trans_id the trans_id to set
	 */
	public void setTrans_id(int trans_id) {
		this.trans_id = trans_id;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ReceiptDetails [trans_id=" + trans_id + "]";
	}

}
