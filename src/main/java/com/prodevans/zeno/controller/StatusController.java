package com.prodevans.zeno.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prodevans.zeno.config.RestConfig;
import com.prodevans.zeno.dao.impl.CategoryListDAOImpl;
import com.prodevans.zeno.dao.impl.ScheduleDAOImpl;
import com.prodevans.zeno.pojo.CategoryList;
import com.prodevans.zeno.pojo.SessionDetails;

@Controller
public class StatusController 
{
	
	@Autowired
    private CategoryListDAOImpl categoryimpl;
	
	@Autowired
	private ScheduleDAOImpl scheduleDAOImpl;
	
	
	@RequestMapping(value = "/getStatus", method = RequestMethod.GET)
	@ResponseBody
	public String getStatus(HttpSession session) 
	{
		JSONObject returnJson = new JSONObject();
		returnJson.put("ParentalStatus", true);
		
		CategoryList list = new CategoryList();
		
        SessionDetails user = (SessionDetails) session.getAttribute("user");
        list = categoryimpl.getCategoryList(user.getActid() + RestConfig.ADVANCED_FILTER, user.getDomid().trim());
            
        System.out.println("first "+list.getBlocked_catogery().isEmpty());
        System.out.println("second "+list.getFilter_pattern().isEmpty() );
        
        if(list.getBlocked_catogery().isEmpty() && list.getFilter_pattern().isEmpty() )
        {
        	System.out.println("Returing value : "+false);
        	returnJson.put("ParentalStatus", false);
        	return "false";
        }
        else
        {
        	System.out.println("Returing value : "+true);
        	return "true";
        }
        
	}

	
	
}
	
	
