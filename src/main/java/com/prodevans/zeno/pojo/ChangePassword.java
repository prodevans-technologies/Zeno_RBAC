package com.prodevans.zeno.pojo;

public class ChangePassword {
	private String actid;
	private String password;
	private String confirm_password;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 
	 */
	public ChangePassword() {
	}

	/**
	 * @param actid
	 * @param password
	 * @param confirm_password
	 */
	public ChangePassword(String actid, String password, String confirm_password) {
		this.actid = actid;
		this.password = password;
		this.confirm_password = confirm_password;
	}

	/**
	 * @return the actid
	 */
	public String getActid() {
		return actid;
	}

	/**
	 * @param actid
	 *            the actid to set
	 */
	public void setActid(String actid) {
		this.actid = actid;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the confirm_password
	 */
	public String getConfirm_password() {
		return confirm_password;
	}

	/**
	 * @param confirm_password
	 *            the confirm_password to set
	 */
	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}

	@Override
	public String toString() {
		return "ChangePassword [actid=" + actid + ", password=" + password + ", confirm_password=" + confirm_password
				+ ", name=" + name + "]";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	

}
