
package com.prodevans.zeno.pojo;

public class UserDetails {

	private String customer_id;
	private String first_name;
	private String last_name;
	private String email;
	private String mobile;
	private int actno;

	/**
	 * @param customer_id
	 * @param first_name
	 * @param last_name
	 * @param email
	 * @param mobile
	 */
	public UserDetails() {

		this.customer_id = "";
		this.first_name = "";
		this.last_name = "";
		this.email = "";
		this.mobile = "";
		this.actno = 0;
	}

	public int getActno() {
		return actno;
	}

	public void setActno(int actno) {
		this.actno = actno;
	}

	/**
	 * @param customer_id
	 * @param first_name
	 * @param last_name
	 * @param email
	 * @param mobile
	 */
	public UserDetails(int actno, String customer_id, String first_name, String last_name, String email,
			String mobile) {

		this.customer_id = customer_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.mobile = mobile;
		this.actno = 0;
	}

	/**
	 * @return the customer_id
	 */
	public String getCustomer_id() {
		return customer_id;
	}

	/**
	 * @param customer_id
	 *            the customer_id to set
	 */
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	/**
	 * @param first_name
	 *            the first_name to set
	 */
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	/**
	 * @return the last_name
	 */
	public String getLast_name() {
		return last_name;
	}

	/**
	 * @param last_name
	 *            the last_name to set
	 */
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile
	 *            the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "UserDetails [customer_id=" + customer_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", email=" + email + ", mobile=" + mobile + ", actno=" + actno + "]";
	}

	/**
	 * @return the first_name
	 */
	public String getFirst_name() {
		return first_name;
	}

}
