package com.prodevans.zeno.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.prodevans.zeno.pojo.InvoiceDetails;
import com.prodevans.zeno.pojo.SessionDetails;
import com.prodevans.zeno.pojo.TopUp;

@Controller
public class TopUpController 
{
	@RequestMapping(value = "/toup50GB", method = RequestMethod.GET)
	public String toup50GB(ModelMap model, HttpSession session,@RequestParam("planName") String planName)
	{
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} 
		else 
		{
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			model.addAttribute("user_details", user);
			//model.addAttribute("act_id",user.getActid());
			//model.addAttribute("name",user.getActname());
			
			TopUp topUp=new TopUp();
			
			String amount="";
			String planSize="";
			String postFUP="";
			boolean dataSet=false;
			if(planName.equals("Add on 5GB"))
			{
				amount="120";
				planSize="5GB";
				postFUP="512 Kbps";
				dataSet=true;
			}
			if(planName.equals("Add on 10GB"))
			{
				amount="220";
				planSize="10GB";
				postFUP="512 Kbps";
				dataSet=true;
			}
			if(dataSet)
			{			
				topUp.setAmount(Double.parseDouble(amount));
				topUp.setPlanName(planName);
				topUp.setPlanSize(planSize);
				topUp.setPostFUP(postFUP);
				model.addAttribute("topUp", topUp);
			}
			else
			{
				topUp.setAmount(0.0);
				topUp.setPlanName("Plese select appropriate plan");
				topUp.setPlanSize("Plese select appropriate plan");
				topUp.setPostFUP("Plese select appropriate plan");
				model.addAttribute("topUp", topUp);
			}
	
			return "topup/toup50GB";
		}
	}
	
	@RequestMapping(value = "/ccvTopUpRequestHandler", method = RequestMethod.POST)
	public String ccavRequestHandler() {
		return "topup/ccvTopUpRequestHandler";
	}
	
	@RequestMapping(value = "/ccvTopUpResponseHandler", method = RequestMethod.POST)
	public String ccvTopUpResponseHandler() {
		return "topup/ccvTopUpResponseHandler";
	}

}
