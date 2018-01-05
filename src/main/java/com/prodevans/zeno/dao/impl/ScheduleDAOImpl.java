package com.prodevans.zeno.dao.impl;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonObject;
import com.prodevans.zeno.config.RestConfig;
import com.prodevans.zeno.dao.ScheduleDAO;
import com.prodevans.zeno.pojo.ScheduleStatusDetails;

public class ScheduleDAOImpl implements ScheduleDAO 
{

	private RestTemplate restTemplate;
    private HttpEntity<String> entity;

    final static private Logger logger = LoggerFactory.getLogger(ScheduleDAOImpl.class);
	
	
	public ScheduleDAOImpl() 
	{
		try {
            /*
			 * Create a trust manager that does not validate certificate chains. It required
			 * for the generating the SSL certificate. If not provided then while connection
			 * it throws SSL certification error.
             */
            TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
                @Override
                public X509Certificate[] getAcceptedIssuers() {
                    return null;
                }

                @Override
                public void checkClientTrusted(X509Certificate[] certs, String authType) {
                }

                @Override
                public void checkServerTrusted(X509Certificate[] certs, String authType) {
                }
            }};

            // Install the all-trusting trust manager
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

            // Create all-trusting host name verifier
            HostnameVerifier allHostsValid = new HostnameVerifier() {
                @Override
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            };

            // Install the all-trusting host verifier
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);

            logger.info("Cretificate installation is succesful.");

        } catch (NoSuchAlgorithmException | KeyManagementException e) {
            logger.error(e.getMessage());
        }
	
	}
	
	
	
	
	@Override
	public boolean applyTimeSchedule(String domain_id,String name, String when, String time_of_day, String access_policy_rule) 
	{
		
		JSONObject requestObject=new JSONObject();
		JSONArray jsonArray=new JSONArray();
		HashMap<String, String> values=new HashMap<String,String>();
		values.put("time-of-day", time_of_day);
		values.put("when", when);
		jsonArray.put(values);
		
		JSONObject requestInnerObject=new JSONObject();
		requestInnerObject.put("recurring", jsonArray);
		requestInnerObject.put("name", name);

		requestObject.put("schedule", requestInnerObject);

		System.out.println("request Object : "+requestObject);
		
		
		if(getAppliedSchedule(requestObject,domain_id,name.trim(), access_policy_rule.trim() ))
		{
			return true;
		}
		else
		{
			return false;
		}	
	}
	
	
	@Override
	public boolean applyDaysSchedule(String domain_id, String name, ArrayList<String> when, String time_of_day, String access_policy_rule) 
	{
		JSONObject requestObject=new JSONObject();
		JSONArray jsonArray=new JSONArray();
		
		for (String str : when) 
		{
			JSONObject innerJsonObject=new JSONObject();
			innerJsonObject.put("when", str);
			innerJsonObject.put("time-of-day", time_of_day);
			jsonArray.put(innerJsonObject);
		}
		
		JSONObject requestInnerObject=new JSONObject();
		requestInnerObject.put("recurring", jsonArray);
		requestInnerObject.put("name", name);

		requestObject.put("schedule", requestInnerObject);

		System.out.println("request Object : "+requestObject);
		
		
		if(getAppliedSchedule(requestObject,domain_id,name.trim(), access_policy_rule.trim()  ))
		{
			return true;
		}
		else
		{
			return false;
		}	
		
	}
	

	@Override
	public boolean applyNonRecurringSchedule(String domain_id, String name, String when, String access_policy_rule) 
	{
		JSONObject requestObject=new JSONObject();
		JSONObject requestInnerObject=new JSONObject();
		requestInnerObject.put("non-recurring", when);
		requestInnerObject.put("name", name);

		requestObject.put("schedule", requestInnerObject);

		System.out.println("request Object : "+requestObject);
		

		if(getAppliedSchedule(requestObject,domain_id,name.trim(), access_policy_rule.trim()  ))
		{
			return true;
		}
		else
		{
			return false;
		}	

	}
	
	
	
	
	
	
	
	
	
	private boolean getAppliedSchedule(JSONObject requestObject,String doman_id,String schedule_name, String access_policy_rule)
	{
        ResponseEntity<String> person;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", "application/json");
        headers.add("Content-Type", "application/json");
       
        /*
		 * Creation of the Entity object for the adding the headers into request.
         */
        entity = new HttpEntity<>(requestObject.toString().trim(),headers);

        /*
		 * Creation of REST TEMPLET object for the executing of the REST calls.
         */
        restTemplate = new RestTemplate();

        /*
		 * Adding the basic type of authentication on the REST TEMPLETE.
         */
        restTemplate.getInterceptors()
                .add(new BasicAuthorizationInterceptor(RestConfig.USER_NAME, RestConfig.PASSWORD));

        /*
		 * Execution of the REST call with basic authentication and JSON response type
         */
        Map<String, String> params = new HashMap<String, String>();
        params.put("domain_id", doman_id.trim());
        params.put("schedule_name", schedule_name.trim());
        try {
            person = restTemplate.exchange(RestConfig.CREATE_SCHEDULE, HttpMethod.PUT, entity, String.class, params);
            if(person.getStatusCodeValue() == 201 | person.getStatusCodeValue() == 204)
            {
                logger.info("Schedule Created");
                
                if(updateAccessPolicyRule(doman_id, access_policy_rule, schedule_name))
                {
                	return true;
                }
                else
                {
                	logger.info("There is some problem in applying access policy rules..");
                	return false;
                }
                
            }
            else{
                logger.info("Failed creating schedule");
                return false;
            }
        } catch (Exception ee) {
            if(ee.getMessage().contains("404")){
                logger.error("Failed creating schedule... with error");
            }
            else{
                logger.error("error: "+ee.getMessage());
            }
            //logger.error("Error body "+person.getBody());
            
        }
        return false;
	}


	private boolean updateAccessPolicyRule(String domain_id, String access_policy_rule, String schedule_name)
	{
		
		JSONObject AccessPolicyObject =getAccessPolicyObject(domain_id,access_policy_rule);
		
		
		AccessPolicyObject.getJSONObject("access-policy").getJSONObject("match").put("schedule", schedule_name);
		
		AccessPolicyObject.getJSONObject("access-policy").getJSONObject("match").getJSONObject("source").put("zone", new JSONObject()).put("site-id", new JSONArray());
		
		
		AccessPolicyObject.getJSONObject("access-policy").getJSONObject("match").getJSONObject("destination").put("zone", new JSONObject()).put("site-id", new JSONArray()).put("address", new JSONObject());
		
		AccessPolicyObject.getJSONObject("access-policy").getJSONObject("match").put("application",new JSONObject()).put("ttl",new JSONObject());
		
		logger.info("Updated Access Policy Object: "+AccessPolicyObject);
		
		
        ResponseEntity<String> person;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", "application/json");
        headers.add("Content-Type", "application/json");
       
        entity = new HttpEntity<>(AccessPolicyObject.toString().trim(),headers);

        restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(RestConfig.USER_NAME, RestConfig.PASSWORD));
        Map<String, String> params = new HashMap<String, String>();
        params.put("domain_id", domain_id.trim());
        params.put("policy_user", access_policy_rule);
        
        try {
            person = restTemplate.exchange(RestConfig.UPDATE_ACCESS_POLICY_RULE, HttpMethod.PUT, entity, String.class, params);
            if(person.getStatusCodeValue() == 201 | person.getStatusCodeValue() == 204)
            {
                logger.info("Access policy rule updated");
                return true;
            }
            else{
                logger.info("Failed updating access policy rule");
                return false;
            }
        } catch (Exception ee) {
            if(ee.getMessage().contains("404")){
                logger.error("Failed updating access policy rule... with error");
            }
            else{
                logger.error("error: "+ee.getMessage());
            }
            //logger.error("Error body "+person.getBody());
            
        }
        
        return false;
		
		
	}
	
	private JSONObject getAccessPolicyObject(String domain_id, String access_policy_rule)
	{
        ResponseEntity<String> person;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", "application/json");
        entity = new HttpEntity<>(headers);
        restTemplate = new RestTemplate();
        restTemplate.getInterceptors().add(new BasicAuthorizationInterceptor(RestConfig.USER_NAME, RestConfig.PASSWORD));
        Map<String, String> params = new HashMap<String, String>();
        params.put("domain_id", domain_id);
        params.put("policy_rule_name", access_policy_rule);
        
        person = restTemplate.exchange(RestConfig.SEARCH_ACCESS_POLICY_RULE, HttpMethod.GET, entity, String.class, params);

        String getbody=person.getBody();
        JSONObject result1=null;
        JSONObject result = new JSONObject(getbody);
        
        if(result.has("access-policy"))
        {
        	return result;
        }
        else
        {
        	result1 = new JSONObject();
        }
        
        return result1;
        
	}


	@Override
	public ScheduleStatusDetails getScheduleStatus(String domain_id, String schedule_object)
	{
        ResponseEntity<String> person;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Accept", "application/json");
        entity = new HttpEntity<>(headers);
        restTemplate = new RestTemplate();
        restTemplate.getInterceptors()
                .add(new BasicAuthorizationInterceptor(RestConfig.USER_NAME, RestConfig.PASSWORD));
        Map<String, String> params = new HashMap<String, String>();
        params.put("domain_id", domain_id);
        params.put("schedule_object", schedule_object);

        person = restTemplate.exchange(RestConfig.SCHEDULE_STATUS, HttpMethod.GET, entity, String.class, params);

        String getbody=person.getBody();
        
        JSONObject result = new JSONObject(getbody).getJSONObject("schedule");
        ScheduleStatusDetails scheduleStatusDetails = new ScheduleStatusDetails();
        
        scheduleStatusDetails.setName(result.getString("name"));
        System.out.println("Name : "+scheduleStatusDetails.getName());
        
        if(result.has("non-recurring"))
        {
        	String data[] = result.getString("non-recurring").split("-");
        	String first[] = data[0].split("@");
        	String second[] = data[1].split("@");
        	
        	scheduleStatusDetails.setStart_date(first[0]);
        	scheduleStatusDetails.setStart_time(first[1]);
        	
        	scheduleStatusDetails.setEnd_date(second[0]);
        	scheduleStatusDetails.setEnd_time(second[1]);
        	
        	
        	/*System.out.println("Start Date : "+scheduleStatusDetails.getStart_date());
        	System.out.println("Start Time : "+scheduleStatusDetails.getStart_time());
        	
        	System.out.println("End Date : "+scheduleStatusDetails.getEnd_date());
        	System.out.println("End Time : "+scheduleStatusDetails.getEnd_time());*/
        	
        	
        }
        
        if(result.has("recurring"))
        {
        	JSONArray recurring = new JSONObject(getbody).getJSONObject("schedule").getJSONArray("recurring");
        	ArrayList<String> when = new ArrayList<String>();
        	String time_of_day = null;
        	
        	JSONObject in = new JSONObject();
        	
        	for (Object s : recurring) 
        	{
        		
        		if ( s instanceof JSONObject ) 
        		{
        	        in = ((JSONObject)s);
        	        when.add(in.getString("when"));
        	        time_of_day = in.getString("time-of-day");
        	    }
			}
        	
        	String data[] = time_of_day.split("-"); 
        	scheduleStatusDetails.setWhen(when);
        	scheduleStatusDetails.setStart_time(data[0]);
        	scheduleStatusDetails.setEnd_time(data[1]);
        	
        	/*
        	System.out.println("When : "+scheduleStatusDetails.getWhen());
        	System.out.println("Start Time : "+scheduleStatusDetails.getStart_time());
        	System.out.println("End Time : "+scheduleStatusDetails.getEnd_time());
        	*/
        	
        }
                
        
        return scheduleStatusDetails;
		
	}	
	
}
