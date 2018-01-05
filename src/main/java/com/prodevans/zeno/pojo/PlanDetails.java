package com.prodevans.zeno.pojo;

public class PlanDetails {
	private String customer_id;
	private String current_plan;
	private String plan_name;
	private double FUP;
	private double used;
	private double due;
	private String due_date;
	private String Basic;
	private String plan_content;

	/**
	 * @param customer_id
	 * @param current_plan
	 * @param plan_name
	 * @param fUP
	 * @param used
	 * @param due
	 * @param due_date
	 * @param basic
	 * @param plan_content
	 */
	public PlanDetails(String customer_id, String current_plan, String plan_name, double fUP, double used, double due,
			String due_date, String basic, String plan_content) {
		this.customer_id = customer_id;
		this.current_plan = current_plan;
		this.plan_name = plan_name;
		FUP = fUP;
		this.used = used;
		this.due = due;
		this.due_date = due_date;
		Basic = basic;
		this.plan_content = plan_content;
	}

	/**
	 * 
	 */
	public PlanDetails() {
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
	 * @return the current_plan
	 */
	public String getCurrent_plan() {
		return current_plan;
	}

	/**
	 * @param current_plan
	 *            the current_plan to set
	 */
	public void setCurrent_plan(String current_plan) {
		this.current_plan = current_plan;
	}

	/**
	 * @return the plan_name
	 */
	public String getPlan_name() {
		return plan_name;
	}

	/**
	 * @param plan_name
	 *            the plan_name to set
	 */
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	/**
	 * @return the fUP
	 */
	public double getFUP() {
		return FUP;
	}

	/**
	 * @param fUP
	 *            the fUP to set
	 */
	public void setFUP(double fUP) {
		FUP = fUP;
	}

	/**
	 * @return the used
	 */
	public double getUsed() {
		return used;
	}

	/**
	 * @param used
	 *            the used to set
	 */
	public void setUsed(double used) {
		this.used = used;
	}

	/**
	 * @return the due
	 */
	public double getDue() {
		return due;
	}

	/**
	 * @param due
	 *            the due to set
	 */
	public void setDue(double due) {
		this.due = due;
	}

	/**
	 * @return the due_date
	 */
	public String getDue_date() {
		return due_date;
	}

	/**
	 * @param due_date
	 *            the due_date to set
	 */
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	/**
	 * @return the basic
	 */
	public String getBasic() {
		return Basic;
	}

	/**
	 * @param basic
	 *            the basic to set
	 */
	public void setBasic(String basic) {
		Basic = basic;
	}

	/**
	 * @return the plan_content
	 */
	public String getPlan_content() {
		return plan_content;
	}

	/**
	 * @param plan_content
	 *            the plan_content to set
	 */
	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PlanDetails [customer_id=" + customer_id + ", current_plan=" + current_plan + ", plan_name=" + plan_name
				+ ", FUP=" + FUP + ", used=" + used + ", due=" + due + ", due_date=" + due_date + ", Basic=" + Basic
				+ ", plan_content=" + plan_content + "]";
	}

}
