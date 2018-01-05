package com.prodevans.zeno.dao;

import java.util.ArrayList;

import org.json.JSONObject;

import com.prodevans.zeno.pojo.ScheduleStatusDetails;

public interface ScheduleDAO 
{

	public boolean applyTimeSchedule(String domain_id,String name, String when, String time_of_day, String access_policy_rule);
	public boolean applyDaysSchedule(String domain_id,String name, ArrayList<String> when, String time_of_day, String access_policy_rule);
	public boolean applyNonRecurringSchedule(String domain_id,String name, String when, String access_policy_rule);
	
	public ScheduleStatusDetails getScheduleStatus(String domain_id, String schedule_object);
	
}
