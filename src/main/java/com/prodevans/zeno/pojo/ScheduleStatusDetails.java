package com.prodevans.zeno.pojo;

import java.util.ArrayList;

public class ScheduleStatusDetails 
{

	public String name;
	public String start_time;
	public String end_time;
	public String start_date;
	public String end_date;
	public ArrayList<String> when;
	
	
	public ScheduleStatusDetails()
	{
		when = new ArrayList<String>();
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	

	public String getStart_time() {
		return start_time;
	}


	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}


	public String getEnd_time() {
		return end_time;
	}


	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public ArrayList<String> getWhen() {
		return when;
	}


	public void setWhen(ArrayList<String> when) {
		this.when = when;
	}


	@Override
	public String toString() {
		return "ScheduleStatusDetails [name=" + name + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", when=" + when + "]";
	}
	
	
	
	
}
