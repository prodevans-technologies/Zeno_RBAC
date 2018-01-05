package com.prodevans.zeno.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.xmlrpc.XmlRpcException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.prodevans.zeno.dao.impl.DashboardDAOImpl;
import com.prodevans.zeno.dao.impl.SendMailDAOImpl;
import com.prodevans.zeno.pojo.InvoiceDetails;
import com.prodevans.zeno.pojo.SendMailDetails;
import com.prodevans.zeno.pojo.ServiceRequest;
import com.prodevans.zeno.pojo.SessionDetails;
import com.prodevans.zeno.pojo.UserDetails;


@Controller
public class MailController
{
	@Autowired
	SendMailDAOImpl feedbackDAOImpl;
	public SendMailDAOImpl getFeedbackDAOImpl() {
		return feedbackDAOImpl;
	}
	

	@RequestMapping(value = "/feedbackPage", method = RequestMethod.GET)
	public ModelAndView feedbackPage(ModelMap model, HttpSession session) throws XmlRpcException 
	{
		if (session.getAttribute("user") == null) 
		{
			return  new ModelAndView("redirect:logout");
		} 
		else 
		{
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			model.addAttribute("user_details", user);
			
			if(session.getAttribute("successfull") != null)
			{
				session.removeAttribute("successfull");
				model.addAttribute("msg", "Thank you for your valuable feedback.");
			}
			
			return  new ModelAndView("feedback","feedbackDetails",new SendMailDetails());
		}
	}
	
	@RequestMapping(value = "/feedbackRequestPage", method = RequestMethod.POST)
	public String feedbackRequest(ModelMap model, HttpSession session,@ModelAttribute(name="feedbackDetails")SendMailDetails feedback,SessionDetails email) throws XmlRpcException 
	{
		SessionDetails user = (SessionDetails) session.getAttribute("user");
		boolean result=feedbackDAOImpl.sentMailFeedback(feedback,email);
		session.setAttribute("successfull", "successfull");
		return  "redirect:feedbackPage";
	}
	
	@RequestMapping(value = "/contactusPage", method = RequestMethod.GET)
	public ModelAndView contactus(ModelMap model, HttpSession session) throws XmlRpcException 
	{
		if (session.getAttribute("user") == null) 
		{
			return  new ModelAndView("redirect:logout");
		} 
		else 
		{
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			model.addAttribute("user_details", user);
			
			if(session.getAttribute("successfull") != null)
			{
				session.removeAttribute("successfull");
				model.addAttribute("msg", "Thanks for your message. Our customer care executive will connect with you shortly. ");
			}
			
			return  new ModelAndView("contactus","contactusDetails",new SendMailDetails());
		}
	}
	
	@RequestMapping(value = "/contactusRequestPage", method = RequestMethod.POST)
	public String contactusRequest(ModelMap model, HttpSession session,@ModelAttribute(name="contactusDetails")SendMailDetails feedback) throws XmlRpcException 
	{
		boolean result=feedbackDAOImpl.sentMailContactUs(feedback);
		session.setAttribute("successfull", "successfull");
		return  "redirect:contactusPage";
	}
	
	
	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public ModelAndView service(Locale locale, Model model, HttpSession session) 
	{
		if (session.getAttribute("user") == null) {
			return new ModelAndView("redirect:logout");
		} 
		else 
		{
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			model.addAttribute("user_details", user);
			model.addAttribute("name", user.getActname());
			model.addAttribute("actid", user.getActid());
			
			ServiceRequest request = new ServiceRequest();
			
			List<String> time_slot_to_call = new ArrayList<String>();
			time_slot_to_call.add("9AM - 12PM");
			time_slot_to_call.add("12PM - 3PM");
			time_slot_to_call.add("3PM - 6PM");
			
			
			request.setTime_slot_to_call(time_slot_to_call);
			model.addAttribute("time_slot_to_call", time_slot_to_call);
			
			if(session.getAttribute("successfull") != null)
			{
				session.removeAttribute("successfull");
				model.addAttribute("msg", "Your request has been received. We'll work on it right away!");
			}

			return  new ModelAndView("serviceRequest","serviceRequestDetails",request);
		}
	}
	
	@RequestMapping(value = "/serviceRequestPage", method = RequestMethod.POST)
	public String serviceRequest(ModelMap model, HttpSession session,@ModelAttribute(name="serviceRequestDetails")ServiceRequest serviceRequest) throws XmlRpcException 
	{
		SessionDetails user = (SessionDetails) session.getAttribute("user");
		serviceRequest.setEmail_id(user.getEmail());
		ServiceRequest request = new ServiceRequest();
		
		/*if(request.getRequestCheckboxArray() ==null || request.getComplaintCheckboxArray() ==null) {
			
			return  "redirect:service";
			
		}*/
		
		boolean result=feedbackDAOImpl.sentMailServiceRequest(serviceRequest);
		session.setAttribute("successfull", "successfull");
		
		System.out.println("Name : "+serviceRequest.getName());
		System.out.println("Mobile : "+serviceRequest.getMobile());
		System.out.println("Message : "+serviceRequest.getMessage());
		return  "redirect:service";
		
		
		//boolean result=feedbackDAOImpl.sentMailServiceRequest(feedback);
		//return  "redirect:service";
	}
	
	@ModelAttribute("requestList")
	public List<String> getRequestList()
	{
		List<String> request=new ArrayList<String>();
		request.add("New Connection");
		request.add("Activation / Deactivation of Services");
		request.add("Duplicate Bill");
		request.add("Change of Location");
		request.add("Restoration of Service");
		request.add("Change Plan");
		request.add("Any Other");
		
		return request;
	}
	
	@ModelAttribute("complaintList")
	public List<String> getComplaintList()
	{
		List<String> complaint=new ArrayList<String>();
		complaint.add("Online Payment Failure");
		complaint.add("Activation / Deactivation of Services");
		complaint.add("Billing Related");
		complaint.add("One8 Website");
		complaint.add("One8 Customer Care");
		complaint.add("FUP/Speed");
		complaint.add("One8 Cube");
		complaint.add("One8 Portal");
		
		return complaint;
	}
	
}