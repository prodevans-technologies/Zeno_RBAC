package com.prodevans.zeno.pojo;

import java.util.ArrayList;

public class ScheduleDetails 
{

	public String time_start_time;
	public String time_end_time;
	
	public String days_start_time;
	public String days_end_time;
	public ArrayList<String>  days_days_checkbox;
	
	public String dates_start_time;
	public String dates_end_time;
	public String dates_start_date;
	public String dates_end_date;
	
	
	
	
	
	public ArrayList<String> getDays_days_checkbox() {
		return days_days_checkbox;
	}
	public void setDays_days_checkbox(ArrayList<String> days_days_checkbox) {
		this.days_days_checkbox = days_days_checkbox;
	}
	public String getTime_start_time() {
		return time_start_time;
	}
	public void setTime_start_time(String time_start_time) {
		this.time_start_time = time_start_time;
	}
	public String getTime_end_time() {
		return time_end_time;
	}
	public void setTime_end_time(String time_end_time) {
		this.time_end_time = time_end_time;
	}
	public String getDays_start_time() {
		return days_start_time;
	}
	public void setDays_start_time(String days_start_time) {
		this.days_start_time = days_start_time;
	}
	public String getDays_end_time() {
		return days_end_time;
	}
	public void setDays_end_time(String days_end_time) {
		this.days_end_time = days_end_time;
	}

	public String getDates_start_time() {
		return dates_start_time;
	}
	public void setDates_start_time(String dates_start_time) {
		this.dates_start_time = dates_start_time;
	}
	public String getDates_end_time() {
		return dates_end_time;
	}
	public void setDates_end_time(String dates_end_time) {
		this.dates_end_time = dates_end_time;
	}
	public String getDates_start_date() {
		return dates_start_date;
	}
	public void setDates_start_date(String dates_start_date) {
		this.dates_start_date = dates_start_date;
	}
	public String getDates_end_date() {
		return dates_end_date;
	}
	public void setDates_end_date(String dates_end_date) {
		this.dates_end_date = dates_end_date;
	}
	
	
}
