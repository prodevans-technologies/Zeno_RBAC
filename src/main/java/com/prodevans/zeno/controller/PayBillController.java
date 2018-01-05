package com.prodevans.zeno.controller;

import java.text.ParseException;

import javax.servlet.http.HttpSession;

import org.apache.xmlrpc.XmlRpcException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.prodevans.zeno.dao.impl.PayBillDAOImpl;
import com.prodevans.zeno.pojo.PayBillDetails;



@Controller
public class PayBillController 
{
	@Autowired
	PayBillDAOImpl payBillDAOImpl;
	public void setPayBillDAOImpl(PayBillDAOImpl payBillDAOImpl) {
		this.payBillDAOImpl = payBillDAOImpl;
	}

	
	@RequestMapping(value = "/payBill", method = RequestMethod.GET)
	public ModelAndView viewBill(ModelMap model, HttpSession session) 
	{
		return  new ModelAndView("paybill/payBill","payBillDetails",new PayBillDetails());
	}
	
	@RequestMapping(value = "/payBillRequest", method = RequestMethod.POST)
	public ModelAndView payBillRequest(ModelMap model, HttpSession session,@ModelAttribute(name="payBillDetails")PayBillDetails bill) throws XmlRpcException 
	{
		bill=payBillDAOImpl.getAccountDetails(bill);
		session.setAttribute("bill",bill);
		return  new ModelAndView("paybill/payBillSendData","bill",bill);
	}
	
	@RequestMapping(value = "/payBillRequestHandler", method = RequestMethod.POST)
	public String payBillRequestHandler(ModelMap model, HttpSession session) 
	{
		return  "paybill/payBillRequestHandler";
	}
	
	@RequestMapping(value = "/payBillResponseHandler", method = RequestMethod.POST)
	public String payBillResponseHandler(ModelMap model, HttpSession session) 
	{
		return  "paybill/payBillResponseHandler";
	}
	
	
	/*
	@RequestMapping(value = "/payBillSendData", method = RequestMethod.GET)
	public void payBillSendData(ModelMap model, HttpSession session) 
	{
		PayBillDetails bill=(PayBillDetails)session.getAttribute("bill");
		model.addAttribute("bill",bill);
		//return "redirect:paybill/payBillSendData";
	}*/
	
	
	
}
