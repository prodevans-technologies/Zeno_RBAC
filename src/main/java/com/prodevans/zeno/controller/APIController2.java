package com.prodevans.zeno.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prodevans.zeno.dao.impl.DashboardDAOImpl;
import com.prodevans.zeno.pojo.SessionDetails;
import com.prodevans.zeno.pojo.SessionHistory;
import com.prodevans.zeno.pojo.SubscriptionDetails;

@Controller
public class APIController2 {

	@Autowired
	private DashboardDAOImpl DashboardImpl;

	public void setDashboardImpl(DashboardDAOImpl dashboardImpl) {
		DashboardImpl = dashboardImpl;
	}

	@RequestMapping(value = "/user-session2", method = RequestMethod.GET)
	@ResponseBody
	public String getSessionHistory(HttpSession session) {

		try {
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			System.out.println(user.toString());

			SubscriptionDetails details = DashboardImpl.getSubscriptionDetails(user.getActid());
			System.out.println("user subscription details : " + details.toString());

			List<SessionHistory> hs = DashboardImpl.getAllSession(details.getStartDate(), details.getExpiryDate(),
					user.getActid());
			hs = normalizeHistory(hs, details.getStartDate());

			System.out.println(hs.toString());

			Collections.sort(hs);
			System.out.println(hs.toString());

			System.out.println("Remove duplicate elemets");
			hs = removeDuplicateHistory(hs);
			System.out.println(hs.toString());
			
			
			System.out.println("Data progression added");
			hs = ProgressionHistory(hs);

			System.out.println(hs.toString());

			return getJson(hs);

		} catch (Exception ee) {
			ee.printStackTrace();
		}
		return null;
	}

	private List<SessionHistory> ProgressionHistory(List<SessionHistory> hs) {
		double total_bytes = 0;
		double download = 0;
		double upload = 0;
		List<SessionHistory> new_hs = new ArrayList<SessionHistory>();
		for (SessionHistory history : hs) {
			total_bytes = total_bytes + history.getTotalbytes();
			history.setTotalbytesMB((long) total_bytes);

			upload = upload + history.getBytesin();
			history.setBytesinMB((long) upload);

			download = download + history.getBytesout();
			history.setBytesoutMB((long) download);

			new_hs.add(history);

		}

		return new_hs;
	}

	private List<SessionHistory> normalizeHistory(List<SessionHistory> hs, Date StartDate) {
		Date check_date = StartDate;
		Date today = new Date();
		while (check_date.after(StartDate) && check_date.before(today)) {
			boolean res = hs.contains(check_date);
			if (res == false) {
				hs.add(new SessionHistory(check_date));
			}

			Calendar c = Calendar.getInstance();
			c.setTime(check_date);
			c.add(Calendar.DATE, 1);
			check_date = c.getTime();
		}

		return hs;
	}
	private List<SessionHistory> removeDuplicateHistory(List<SessionHistory> hs) {
	//	Date check_date = StartDate;
	// today = new Date();
		List<SessionHistory> new_hs =new ArrayList<>();
		
		for(int i =0 ; i < hs.size() ; i++) {
			for(int j =i + 1 ; j < hs.size() ; j++) {
				if(hs.get(i).getDate().equals(hs.get(j).getDate())) {
					hs.get(i).add(hs.get(j));
					hs.remove(j);
				}
			}
			new_hs.add(hs.get(i));
		}

		return new_hs;
	}
	private String getJson(List<SessionHistory> hs) {
		
		JSONArray colomn = new JSONArray();

		JSONObject col1 = new JSONObject();
		
		JSONObject data = new JSONObject();
		
		col1.put("type", "number");
		col1.put("label", "Upload");
		colomn.put(col1);

		JSONObject col2 = new JSONObject();
		col2.put("type", "number");
		col2.put("label", "Download");
		colomn.put(col2);

		JSONObject col3 = new JSONObject();
		col3.put("type", "number");
		col3.put("label", "Total Data");
		colomn.put(col3);

		
		data.put("cols", colomn);
	
			
		JSONArray rows = new JSONArray();

		JSONObject row = new JSONObject();

		JSONArray jarr = new JSONArray();

		JSONObject element2 = new JSONObject();
		element2.put("v", "Upload");
		element2.put("f", 0+" GB");
		jarr.put(element2);

		JSONObject element3 = new JSONObject();
		element3.put("v", "Download");
		element3.put("f", 0+" GB");
		jarr.put(element3);

		JSONObject element4 = new JSONObject();
		element4.put("v", "Total Data");
		element4.put("f", 0+" GB");
		jarr.put(element4);

		row.put("c", jarr);
		rows.put(row);

		//int cnt = 1;
		for (SessionHistory history : hs) {

			row = new JSONObject();

			jarr = new JSONArray();

			element2 = new JSONObject();
			element2.put("v", history.getBytesin());
			element2.put("f", history.getBytesin()+" GB");
			jarr.put(element2);

			element3 = new JSONObject();
			element3.put("v", history.getBytesout());
			element3.put("f", history.getBytesout()+" GB");
			jarr.put(element3);

			element4 = new JSONObject();
			element4.put("v", history.getTotalbytes());
			element4.put("f", history.getTotalbytes()+" GB");
			jarr.put(element4);

			row.put("c", jarr);
			//rows.put(row);
		}

		data.put("rows", row);
		
			
		
		System.out.println("=======================================Data of Usage=================================");
		System.out.println(data.toString());
		System.out.println("=======================================Data of Usage=================================");
		
		return data.toString();
	}

}
