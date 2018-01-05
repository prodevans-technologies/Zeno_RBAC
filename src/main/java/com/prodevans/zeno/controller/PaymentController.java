package com.prodevans.zeno.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.xmlrpc.XmlRpcException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prodevans.zeno.dao.impl.DashboardDAOImpl;
import com.prodevans.zeno.dao.impl.InvoiceDAOImpl;
//import com.ccavenue.security.AesCryptUtil;
import com.prodevans.zeno.dao.impl.PaymentDAOImpl;
import com.prodevans.zeno.dao.impl.rcDAOImpl;
import com.prodevans.zeno.pojo.InvoiceDetails;
import com.prodevans.zeno.pojo.PaymentDetails;
import com.prodevans.zeno.pojo.RcDetails;
import com.prodevans.zeno.pojo.SessionDetails;
import com.prodevans.zeno.pojo.SubscriptionDetails;

@Controller
public class PaymentController {

    @Autowired
    private PaymentDAOImpl paymentDAOImpl;

    public void setPaymentDAOImpl(PaymentDAOImpl paymentDAOImpl) {
        this.paymentDAOImpl = paymentDAOImpl;
    }

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

    /*
	 * @Autowired private PaymentDetails paymentDetails; public void
	 * setPaymentDetails(PaymentDetails paymentDetails) { this.paymentDetails =
	 * paymentDetails; }
     */
    private PaymentDetails paymentDetails = new PaymentDetails();

    @RequestMapping(value = "/billingPayment", method = RequestMethod.GET)
    public String billingPayment(ModelMap model, HttpSession session) throws XmlRpcException, ParseException {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            SessionDetails user = (SessionDetails) session.getAttribute("user");
            model.addAttribute("user_details", user);
            

            // for getting invoice details
            InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
            RcDetails rcdetails = rcImpl.getrcdetails(user.getActid(), user.isGetClosed(), user.getFromDate(), user.getToDate());

            model.addAttribute("invoiceDetails", invoiceDetails);
            session.setAttribute("amount", rcdetails.getAmount());
            SubscriptionDetails details = DashboardImpl.getSubscriptionDetails(user.getActid());
            System.out.println("user subscription details : " + details.toString());
            model.addAttribute("SubscriptionDetails", details);
            model.addAttribute("amount", rcdetails.getAmount());
            
            

            /*
			 * double pendingAmount=paymentDAOImpl.getPendingAmount(user.getActno());
			 * session.setAttribute("pendingAmount", pendingAmount);
			 * model.addAttribute("pendingAmount",pendingAmount);
             */
            return "billingPayment";
        }
    }

    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public String doPayment(ModelMap model, HttpSession session) throws XmlRpcException, ParseException {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            SessionDetails user = (SessionDetails) session.getAttribute("user");
            model.addAttribute("user_details", user);
            model.addAttribute("act_id", user.getActid());

            // for getting invoice details
            InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
            model.addAttribute("invoiceDetails", invoiceDetails);
            return "payment/sendData";
        }

    }

    @RequestMapping(value = "/sampleSendData", method = RequestMethod.GET)
    public String sampleSendData(ModelMap model, HttpSession session) throws XmlRpcException, ParseException {
        SessionDetails user = (SessionDetails) session.getAttribute("user");

        /*
		 * paymentDetails.setActno(user.getActno()); paymentDetails.setCurrency("INR");
		 * paymentDetails.setInstrument_detail("instrument Details");
		 * paymentDetails.setInstrumentid(3);
		 * paymentDetails.setTrans_amount(user.getPendingAmount());
		 * paymentDetails.setTrans_date("Date ");
		 * paymentDetails.setTrans_descr("Transaction Description");
		 * paymentDetails.setTrans_type("Credit Card");
         */
        model.addAttribute("user_details", user);

        // for getting invoice details
        InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
        model.addAttribute("invoiceDetails", invoiceDetails);

        return "payment/sampleSendData";
    }

    @RequestMapping(value = "/viewBill", method = RequestMethod.GET)
    public String viewBill(ModelMap model, HttpSession session) throws XmlRpcException, ParseException {
        SessionDetails user = (SessionDetails) session.getAttribute("user");
        model.addAttribute("user_details", user);
        // for getting invoice details
        InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
        model.addAttribute("invoiceDetails", invoiceDetails);
        System.out.println("result:" + invoiceDetails.getContent());
        if (invoiceDetails.getContent() == "NA") {
            return "billna";
        } else {
            return "payment/viewBill";
        }
    }

    @RequestMapping(value = "/ccavRequestHandler", method = RequestMethod.POST)
    public String ccavRequestHandler(ModelMap model, HttpSession session, HttpServletRequest request) {
        //return "payment/ccavRequestHandler";

        double amount = Double.parseDouble(request.getParameter("trans_amount"));
        System.out.println("Amount : " + amount);
        if (amount > 0) {
            return "payment/ccavRequestHandler";
        }

        SessionDetails user = (SessionDetails) session.getAttribute("user");
        model.addAttribute("user_details", user);
        model.addAttribute("act_id", user.getActid());

        // for getting invoice details
        InvoiceDetails invoiceDetails = invoiceDAOImpl.getInvoice(user.getActno());
        model.addAttribute("invoiceDetails", invoiceDetails);

        model.addAttribute("isValidAmount", "Payable amount is zero..");
        return "payment/sendData";

    }

    @RequestMapping(value = "/ccvCancelResponse", method = RequestMethod.POST)
    public String ccvCancelResponse() {
        return "payment/ccvCancelResponse";
    }

    @RequestMapping(value = "/ccavResponseHandler", method = RequestMethod.POST)
    public String ccavResponseHandler(ModelMap model, HttpSession session, HttpServletRequest request)
            throws XmlRpcException {
        return "payment/ccavResponseHandler";
    }

    @RequestMapping(value = "/viewReceipt", method = RequestMethod.POST)
    public String viewReceipt(ModelMap model, HttpSession session, HttpServletRequest request) throws XmlRpcException, ParseException {
        //System.out.print("Data from controller :"+request.getParameter("viewReceipt"));
        //model.addAttribute("viewReceipt",request.getParameter("viewReceipt"));

        return "payment/viewReceipt";
    }

}
