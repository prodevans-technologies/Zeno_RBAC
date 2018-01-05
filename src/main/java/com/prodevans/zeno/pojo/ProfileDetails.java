package com.prodevans.zeno.pojo;

public class ProfileDetails {
	private String actid;
	private String actcat;
	private String fname;
	private String lname;
	private String email;
	private String mobileno;
	private String address;
	private String cityname;
	private String password;

	/**
	 * 
	 */
	public ProfileDetails() {
	}

	/**
	 * @param actid
	 * @param actcat
	 * @param fname
	 * @param lname
	 * @param email
	 * @param mobileno
	 * @param address
	 * @param cityname
	 * @param password
	 */
	public ProfileDetails(String actid, String actcat, String fname, String lname, String email, String mobileno,
			String address, String cityname, String password) {
		this.actid = actid;
		this.actcat = actcat;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobileno = mobileno;
		this.address = address;
		this.cityname = cityname;
		this.password = password;
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
	 * @return the actcat
	 */
	public String getActcat() {
		return actcat;
	}

	/**
	 * @param actcat
	 *            the actcat to set
	 */
	public void setActcat(String actcat) {
		this.actcat = actcat;
	}

	/**
	 * @return the fname
	 */
	public String getFname() {
		return fname;
	}

	/**
	 * @param fname
	 *            the fname to set
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}

	/**
	 * @return the lname
	 */
	public String getLname() {
		return lname;
	}

	/**
	 * @param lname
	 *            the lname to set
	 */
	public void setLname(String lname) {
		this.lname = lname;
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
	 * @return the mobileno
	 */
	public String getMobileno() {
		return mobileno;
	}

	/**
	 * @param mobileno
	 *            the mobileno to set
	 */
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the cityname
	 */
	public String getCityname() {
		return cityname;
	}

	/**
	 * @param cityname
	 *            the cityname to set
	 */
	public void setCityname(String cityname) {
		this.cityname = cityname;
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

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ProfileDetails [actid=" + actid + ", actcat=" + actcat + ", fname=" + fname + ", lname=" + lname
				+ ", email=" + email + ", mobileno=" + mobileno + ", address=" + address + ", cityname=" + cityname

				+ "]";
	}

}
