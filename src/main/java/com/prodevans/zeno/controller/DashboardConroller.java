
package com.prodevans.zeno.controller;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prodevans.zeno.dao.impl.DashboardDAOImpl;
import com.prodevans.zeno.dao.impl.InvoiceDAOImpl;
import com.prodevans.zeno.dao.impl.rcDAOImpl;
import com.prodevans.zeno.pojo.InvoiceDetails;
import com.prodevans.zeno.pojo.SessionDetails;
import com.prodevans.zeno.pojo.SubscriptionDetails;
import com.prodevans.zeno.pojo.UserDetails;
import com.prodevans.zeno.pojo.RcDetails;

@Controller
public class DashboardConroller {

	@Autowired
	private DashboardDAOImpl DashboardImpl;

	public void setDashboardImpl(DashboardDAOImpl dashboardImpl) {
		DashboardImpl = dashboardImpl;
	}

	@Autowired
	private InvoiceDAOImpl invoiceDAOImpl;

	public void setInvoiceDAOImpl(InvoiceDAOImpl invoiceDAOImpl) {
		this.invoiceDAOImpl = invoiceDAOImpl;
	}
	
	@Autowired
	private rcDAOImpl rcImpl;

	public void setRc(rcDAOImpl RcImpl) {
		rcImpl = RcImpl;
	}

	/**
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String getDashboard(ModelMap model, HttpSession session) {

		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			try {
				SessionDetails user = (SessionDetails) session.getAttribute("user");
				System.out.println(user.toString());
				UserDetails userdetails = DashboardImpl.getUserDetails(user.getActid());
				RcDetails rcdetails=rcImpl.getrcdetails(user.getActid(), user.isGetClosed(), user.getFromDate(),user.getToDate());

				// for getting invoice details
				InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
				model.addAttribute("invoiceDetails", invoiceDetails);

				model.addAttribute("user_details", user);

				SubscriptionDetails details = DashboardImpl.getSubscriptionDetails(user.getActid());
				System.out.println("user subscription details : " + details.toString());
				model.addAttribute("SubscriptionDetails", details);
				session.setAttribute("plan", details.getRatePlan());
				session.setAttribute("FUP", details.getFUPLimit());

				session.setAttribute("amount", rcdetails.getAmount());
				session.setAttribute("brcdesc", rcdetails.getBrcdesc());
				

                               
                                //set ip address to the user for the parental control.
				session.setAttribute("user_ip_address", details.getIp_address());
                                        

				model.addAttribute("plan", details.getRatePlan());
				model.addAttribute("FUP", details.getFUPLimit());
				model.addAttribute("amount",rcdetails.getAmount());
				model.addAttribute("brcdesc",rcdetails.getBrcdesc());

				/*
				 * List<SessionHistory> hs = DashboardImpl.getAllSession(details.getStartDate(),
				 * details.getExpiryDate(), user.getActid());
				 * model.addAttribute("SessionHistory", hs);
				 */

			} catch (Exception ee) {
				ee.printStackTrace();
			}
			return "dashboard";
		}
	}
	
	@RequestMapping(value = "/dashboards", method = RequestMethod.GET)
	public String getDashboards(ModelMap model, HttpSession session) {

		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			try {
				SessionDetails user = (SessionDetails) session.getAttribute("user");
				System.out.println(user.toString());
				UserDetails userdetails = DashboardImpl.getUserDetails(user.getActid());
				RcDetails rcdetails=rcImpl.getrcdetails(user.getActid(), user.isGetClosed(), user.getFromDate(),user.getToDate());

				// for getting invoice details
				InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
				model.addAttribute("invoiceDetails", invoiceDetails);

				model.addAttribute("user_details", user);

				SubscriptionDetails details = DashboardImpl.getSubscriptionDetails(user.getActid());
				System.out.println("user subscription details : " + details.toString());
				model.addAttribute("SubscriptionDetails", details);
				session.setAttribute("plan", details.getRatePlan());
				session.setAttribute("FUP", details.getFUPLimit());

				session.setAttribute("amount", rcdetails.getAmount());
				session.setAttribute("brcdesc", rcdetails.getBrcdesc());
				

                               
                                //set ip address to the user for the parental control.
				session.setAttribute("user_ip_address", details.getIp_address());
                                        

				model.addAttribute("plan", details.getRatePlan());
				model.addAttribute("FUP", details.getFUPLimit());
				model.addAttribute("amount",rcdetails.getAmount());
				model.addAttribute("brcdesc",rcdetails.getBrcdesc());

				/*
				 * List<SessionHistory> hs = DashboardImpl.getAllSession(details.getStartDate(),
				 * details.getExpiryDate(), user.getActid());
				 * model.addAttribute("SessionHistory", hs);
				 */

			} catch (Exception ee) {
				ee.printStackTrace();
			}
			return "dashboards";
		}
	}

	@RequestMapping(value = "/currentplan", method = RequestMethod.GET)
	public String currentPlan(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "currentplan";
		}
	}

	

	@RequestMapping(value = "/knowYourCPE", method = RequestMethod.GET)
	public String knowYourCPE(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "knowYourCPE";
		}
	}
	
	@RequestMapping(value = "/knowYourBill", method = RequestMethod.GET)
	public String knowYourBill(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		else 
		{
			SessionDetails user = (SessionDetails) session.getAttribute("user");
			model.addAttribute("user_details", user);
			
			// for getting invoice details
			InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
			model.addAttribute("invoiceDetails", invoiceDetails);
			
			SubscriptionDetails details = DashboardImpl.getSubscriptionDetails(user.getActid());
			System.out.println("user subscription details : " + details.toString());
			model.addAttribute("SubscriptionDetails", details);
			
			return "knowYourBill";
		}
	}

	@RequestMapping(value = "/topup", method = RequestMethod.GET)
	public String topup(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "topup";
		}

	}
	
	@RequestMapping(value = "/YourPlan", method = RequestMethod.GET)
	public String YourPlan(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else 
		{
			return "YourPlan";
		}

	}
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "help";
		}

	}

	@RequestMapping(value = "/terms", method = RequestMethod.GET)
	public String terms(ModelMap model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "terms";
		}
	}

	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public String refund(ModelMap model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "refund";
		}
	}

	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public String privacy(ModelMap model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		} else {
			return "privacy";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpSession session, HttpServletResponse res) {
		if (session.getAttribute("user") != null) {
			session.invalidate();
			Cookie ck = new Cookie("user", "");
			ck.setHttpOnly(true);
			ck.setMaxAge(0);
			res.addCookie(ck);
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/slider", method = RequestMethod.GET)
	public String slider(Locale locale, Model model, HttpSession session) {
		
			return "slider";
		
	}
        
        
	
	
}
