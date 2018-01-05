package com.prodevans.zeno.controller;

import com.prodevans.zeno.config.RestConfig;
import com.prodevans.zeno.dao.impl.CategoryListDAOImpl;
import com.prodevans.zeno.dao.impl.ProtectionStatusImpl;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prodevans.zeno.dao.impl.RegistrationUserParentalControlImpl;
import com.prodevans.zeno.dao.impl.ScheduleDAOImpl;
import com.prodevans.zeno.pojo.CategoryList;
import com.prodevans.zeno.pojo.ParentalControlDetails;
import com.prodevans.zeno.pojo.ScheduleDetails;
import com.prodevans.zeno.pojo.ScheduleStatusDetails;
import com.prodevans.zeno.pojo.SessionDetails;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ParentalControl {

    @Autowired
    private RegistrationUserParentalControlImpl REGISTER_PROCESS;

    @Autowired
    private ProtectionStatusImpl PROTECTION_STATUS;

    @Autowired
    private CategoryListDAOImpl categoryimpl;
    
    @Autowired
    private ScheduleDAOImpl scheduleDAOImpl;

    /**
     * Created logger object for the logging.
     */
    private static final Logger logger = LoggerFactory.getLogger(ParentalControl.class);

    /**
     * @param rEGISTER_PROCESS
     */
    public void setREGISTER_PROCESS(RegistrationUserParentalControlImpl rEGISTER_PROCESS) {
        REGISTER_PROCESS = rEGISTER_PROCESS;
    }

    /**
     * GET REQUEST FOR THE PARENTAL CONTROL.
     *
     * @param locale
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/control", method = RequestMethod.GET)
    public ModelAndView parentControl(Locale locale, Model model, HttpSession session) {

        //Error messages from the Advance filtering...
        model.addAttribute("error", session.getAttribute("error") == null ? "" : session.getAttribute("error").toString());
        session.removeAttribute("error");
        
        model.addAttribute("uodateURLError", session.getAttribute("uodateURLError") == null ? "" : session.getAttribute("uodateURLError").toString());
        session.removeAttribute("uodateURLError");

        //Error messages form the scheduling
        model.addAttribute("msg", session.getAttribute("msg") == null ? "" : session.getAttribute("msg").toString());
        session.removeAttribute("msg");
        
        
        //Error messages form the Advanced Tab
        model.addAttribute("advanced_error", session.getAttribute("advanced_error") == null ? "" : session.getAttribute("advanced_error").toString());
        session.removeAttribute("advanced_error");
        
         //Error messages form the Blocked Tab
        model.addAttribute("blocked_error", session.getAttribute("blocked_error") == null ? "" : session.getAttribute("blocked_error").toString());
        session.removeAttribute("blocked_error");
        
        //Error messages form the Custom Tab unblock website
        model.addAttribute("custom_error", session.getAttribute("custom_error") == null ? "" : session.getAttribute("custom_error").toString());
        session.removeAttribute("custom_error");
        
        //Error messages form the Custom Tab block website
        model.addAttribute("update_url_error", session.getAttribute("update_url_error") == null ? "" : session.getAttribute("update_url_error").toString());
        session.removeAttribute("update_url_error");
        
         //Error messages form the Time Scheduling
        model.addAttribute("time_msg", session.getAttribute("time_msg") == null ? "" : session.getAttribute("time_msg").toString());
        session.removeAttribute("time_msg");
        
         //Error messages form the Day Scheduling
        model.addAttribute("day_msg", session.getAttribute("day_msg") == null ? "" : session.getAttribute("day_msg").toString());
        session.removeAttribute("day_msg");
        
         //Error messages form the Date Scheduling
        model.addAttribute("date_msg", session.getAttribute("date_msg") == null ? "" : session.getAttribute("date_msg").toString());
        session.removeAttribute("date_msg");
        
        
        CategoryList list = new CategoryList();
        if (session.getAttribute("user") == null) {
            return new ModelAndView("redirect:logout");
        } else {
            try {
                //fetching the user details from the session.
                SessionDetails user = (SessionDetails) session.getAttribute("user");
                String ip_address = (String) session.getAttribute("user_ip_address");
                model.addAttribute("uesr_name", user.getActname());
                model.addAttribute("actid", user.getActid());

                ScheduleStatusDetails scheduleStatusDetails = new ScheduleStatusDetails();
                
                if(  !ip_address.isEmpty() || ip_address != null)
                {
                
	                
	                boolean check_ip_result = REGISTER_PROCESS.checkRegistration(user.getActid(), user.getDomid().trim(), ip_address);
	                if (check_ip_result) 
	                {
	                    //Return the parental control status/Details.
	                    //parentalControlDetails = PROTECTION_STATUS.getProtectionDetails(user.getActid(), user.getDomid().trim());
	                    list = categoryimpl.getCategoryList(user.getActid() + RestConfig.ADVANCED_FILTER, user.getDomid().trim());
	                    model.addAttribute("CAT", list);
	
	                    System.out.println("Calling schedule status...");
	                    
	                    scheduleStatusDetails = scheduleDAOImpl.getScheduleStatus(user.getDomid().trim(), user.getActid().trim()+"_SCHEDULE");
	                    System.out.println("Surf Safe Scheduling Status  ::  \n"+scheduleStatusDetails.toString()); 
	                    System.out.println("start time  \n"+scheduleStatusDetails.start_time); 
	                    model.addAttribute("StatusDetails",scheduleStatusDetails);
	                    
	                    //parentalControlDetails.setUser_name(user.getActid());
	                    //Displaying the list of Adderss objects
	                } else {
	                    // Checking of IP address is get found in the session or not
	                    if (!check_ip_result) {
	                        if (!ip_address.isEmpty()) {
	                            //Regestration process for the uesr.
	                            REGISTER_PROCESS.registerUser(user.getActid(), ip_address, user.getDomid().trim());
	                            //Return the parental control status/Details.
	                            list = categoryimpl.getCategoryList(user.getActid() + RestConfig.ADVANCED_FILTER, user.getDomid().trim());
	                            model.addAttribute("CAT", list);
	
	                            model.addAttribute("ScheduleDetails", new ScheduleDetails());
	
	                            
	                            //parentalControlDetails = PROTECTION_STATUS.getProtectionDetails(user.getActid(), user.getDomid().trim());
	                            //parentalControlDetails.setUser_name(user.getActid());
	                            //Displaying the list of Adderss objects
	                        } else {
	                            model.addAttribute("message", "IP address is not found");
	                            logger.error("IP address is not found ");
	                        }
	                    }
	                     model.addAttribute("message", "user "+user.getActname()+" is succesfually registered in prental control");
	                    
	                }

                }

            } catch (Exception e) {
                logger.error(e.getMessage());
            }

            //model.addAttribute("ParentalControlDetails", parentalControlDetails);
            //return "filter";
            return new ModelAndView("filter", "CategoryListDetails", list);
        }
    }

    @RequestMapping(value = "/allow-categories", method = RequestMethod.POST)
    public String allowcategories(ModelMap model, HttpSession session, @ModelAttribute(name = "CategoryListDetails") CategoryList categoryList, @RequestParam(name = "category_allowed", required = false) ArrayList<String> category_allowed) {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {

            if (category_allowed == null) {
                session.setAttribute("advanced_error", "Select Category and hit BLOCK.");
                return "redirect:/control";
            }
            categoryList.getBlocked_catogery().addAll(category_allowed);
            categoryList.getAllowded_catogery().removeAll(category_allowed);

            System.out.println("Blocked List : " + categoryList.getBlocked_catogery());
            System.out.println("Allowed List : " + categoryList.getAllowded_catogery());

            //fetching the user details from the session.
            SessionDetails user = (SessionDetails) session.getAttribute("user");

            if (categoryimpl.updateCategoryList(categoryList.getBlocked_catogery(), categoryList.getAllowded_catogery(), user.getDomid(), user.getActid(), "update_block")) {
                session.setAttribute("advanced_error", "Done! The chosen Category is now blocked.");
            } else {
                session.setAttribute("advanced_error", "Oops! Category blocking failed. Please try again.");

            }

            return "redirect:/control";
        }
    }

    @RequestMapping(value = "/block-categories", method = RequestMethod.POST)
    public String blockcategories(ModelMap model, HttpSession session, @ModelAttribute(name = "CategoryListDetails") CategoryList categoryList, @RequestParam(name = "category_block", required = false) ArrayList<String> category_allowed) 
    {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else 
        {

            if (category_allowed == null) 
            {
                session.setAttribute("blocked_error", "Select Category to UNBLOCK.");
                return "redirect:/control";
            }
            
            //fetching the user details from the session.
            SessionDetails user = (SessionDetails) session.getAttribute("user");
            
            if(performUnblockingCategories(user, categoryList, category_allowed))
            {
            	session.setAttribute("blocked_error", "Done! Category successfully unblocked.");
            	return "redirect:/control";
            }
            else
            {
            	session.setAttribute("blocked_error", "Oops! Category unblocking failed. Please try again. ");
            	return "redirect:/control";
            }
            
        }
    }

    private boolean performUnblockingCategories(SessionDetails user, CategoryList categoryList, ArrayList<String> category_allowed )
    {
    	categoryList.getBlocked_catogery().removeAll(category_allowed);
        categoryList.getAllowded_catogery().addAll(category_allowed);

        System.out.println("Blocked List : " + categoryList.getBlocked_catogery());
        System.out.println("Allowed List : " + categoryList.getAllowded_catogery());

        if (categoryimpl.updateCategoryList(categoryList.getBlocked_catogery(), categoryList.getAllowded_catogery(), user.getDomid(), user.getActid(), "update_allow")) 
        {
        	return true;	
        } 
        else 
        {
        	return false;
        }
    	
    }   
    
    
    @RequestMapping(value = "/block-all-categories", method = RequestMethod.POST)
    public String blockallcategories(ModelMap model, HttpSession session, @ModelAttribute(name = "CategoryListDetails") CategoryList categoryList) 
    {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } 
        else 
        {
        	//fetching the user details from the session.
            SessionDetails user = (SessionDetails) session.getAttribute("user");

            if(categoryList.getBlocked_catogery().isEmpty())
            {
            	session.setAttribute("blocked_error", "Oops! Category unblocking failed. There are no any Categories to Unblock.");
            	return "redirect:/control";
            }
            
            
            categoryList.getAllowded_catogery().addAll(categoryList.getBlocked_catogery());
            categoryList.getBlocked_catogery().removeAll(categoryList.getBlocked_catogery());

            if (categoryimpl.updateCategoryList(categoryList.getBlocked_catogery() , categoryList.getAllowded_catogery(), user.getDomid(), user.getActid(), "update_allow")) 
            {
            	session.setAttribute("blocked_error", "Done! Categories successfully unblocked.");
            	return "redirect:/control";
            } else 
            {
            	session.setAttribute("blocked_error", "Oops! Category unblocking failed. Please try again. ");
            	return "redirect:/control";
            }

        }
    }
       
    
    
    @RequestMapping(value = "/delete-patterns", method = RequestMethod.POST)
    public String deletepatterns(ModelMap model, HttpSession session, @ModelAttribute(name = "CategoryListDetails") CategoryList categoryList, @RequestParam(name = "filter_category", required = false) ArrayList<String> selected_filter_category) 
    {

        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {

            if (selected_filter_category == null) {
                session.setAttribute("custom_error", "Select the URL you want to unblock.");

                return "redirect:/control";
            }
            
            System.out.println("URL List : "+categoryList.getRemove_filter_pattern().toString());
            
            categoryList.getRemove_filter_pattern().removeAll(selected_filter_category);

            //fetching the user details from the session.
            SessionDetails user = (SessionDetails) session.getAttribute("user");
            if (categoryimpl.updateFilterPattern(categoryList.getRemove_filter_pattern(), user.getDomid(), user.getActid() + RestConfig.ADVANCED_FILTER)) {
                session.setAttribute("custom_error", "Done! URL successfully unblocked.");
            } else {
                session.setAttribute("custom_error", "Oops! URL unblocking failed. Please try again.");
            }

            return "redirect:/control";
        }

    }
    
    @RequestMapping(value = "/delete-all-patterns", method = RequestMethod.POST)
    public String deleteallpatterns(ModelMap model, HttpSession session, @ModelAttribute(name = "CategoryListDetails") CategoryList categoryList)
    {
        
        //fetching the user details from the session.
        SessionDetails user = (SessionDetails) session.getAttribute("user");
        
        if(categoryList.getRemove_filter_pattern().isEmpty())
        {
        	session.setAttribute("custom_error", "Oops! URL unblocking failed. There are no any URL's to Unblock.");
        	return "redirect:/control";
        }
        
        categoryList.getRemove_filter_pattern().clear();
        
        if (categoryimpl.updateFilterPattern(categoryList.getRemove_filter_pattern(), user.getDomid(), user.getActid() + RestConfig.ADVANCED_FILTER)) {
            session.setAttribute("custom_error", "Done! URL's successfully unblocked.");
        } else {
            session.setAttribute("custom_error", "Oops! URL unblocking failed. Please try again.");
        }

        return "redirect:/control"; 
    }
    
    
    
    
    

    @RequestMapping(value = "/update-patterns", method = RequestMethod.POST)
    public String updatePatterns(ModelMap model, HttpSession session, @ModelAttribute(name = "CategoryListDetails") CategoryList categoryList, @RequestParam(name = "url_pattern", required = false) String selected_filter_category) {
        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            Pattern pattern = null;

			if (Pattern.compile("[w]{3}[.][\\w]+[.][a-zA-Z]+[.][a-zA-Z]+").matcher(selected_filter_category).find()) {
				pattern = Pattern.compile("[.][\\w]+[.][a-zA-Z]+[.][a-zA-Z]+");
			} else if (Pattern.compile("[w]{3}[.][\\w]+[.][a-zA-Z]+").matcher(selected_filter_category).find()) {
				pattern = Pattern.compile("[.][\\w]+[.][a-zA-Z]+");
			} else if (Pattern.compile("[h][t]{2}[p][s]{0,1}[:][/]{2}[\\w]+[.][a-zA-Z]+[.][a-zA-Z]+").matcher(selected_filter_category)
					.find()) {
				pattern = Pattern.compile("[\\w]+[.][a-zA-Z]+[.][a-zA-Z]+");
			} else if (Pattern.compile("[h][t]{2}[p][s]{0,1}[:][/]{2}[\\w]+[.][a-zA-Z]+").matcher(selected_filter_category).find()) {
				pattern = Pattern.compile("[\\w]+[.][a-zA-Z]+");
			}else if (Pattern.compile("[h][t]{2}[p][s]{0,1}[:][/]{2}[\\d]{1,3}[\\W][\\d]{1,3}[\\W][\\d]{1,3}[\\W][\\d]{1,3}[/]{0,1}[a-zA-Z]*").matcher(selected_filter_category).find()) {
				pattern = Pattern.compile("[\\d]{1,3}[\\W][\\d]{1,3}[\\W][\\d]{1,3}[\\W][\\d]{1,3}");
			}

            
           
           
            try {
                 Matcher matcher = pattern.matcher(selected_filter_category);
            matcher.find();
            selected_filter_category = matcher.group().replaceAll("\\s+", "").substring(0, matcher.group().length());
               
            System.out.println("output1:--"+selected_filter_category);
                if(selected_filter_category.charAt(0)=='.')
			selected_filter_category=selected_filter_category.substring(1);
           
                    System.out.println("output2:--"+selected_filter_category);
           
                 categoryList.getRemove_filter_pattern().add(".*" + selected_filter_category + ".*");    
                //fetching the user details from the session.
                SessionDetails user = (SessionDetails) session.getAttribute("user");
                if (categoryimpl.updateFilterPattern(categoryList.getRemove_filter_pattern(), user.getDomid(), user.getActid() + RestConfig.ADVANCED_FILTER)) {
                    session.setAttribute("update_url_error", "Done! The chosen URL is now blocked.");
                } else {
                    session.setAttribute("update_url_error", "Oops! URL blocking failed. Please try again.");
                }
            } catch (Exception e) {
                logger.error("Error : " + e.getMessage());
                session.setAttribute("update_url_error", "Type out the URL to block a website.");
            }

            return "redirect:/control";
        }

    }

    /**
     * @param PROTECTION_STATUS the PROTECTION_STATUS to set
     */
    public void setPROTECTION_STATUS(ProtectionStatusImpl PROTECTION_STATUS) {
        this.PROTECTION_STATUS = PROTECTION_STATUS;
    }

    @RequestMapping(value = "/control", method = RequestMethod.POST)
    public String changeProtectionStatus(Locale locale, Model model, HttpSession session, @ModelAttribute(name = "ParentalControlDetails") ParentalControlDetails controlDetails) {

        logger.info(" Protection Status : " + controlDetails.getProtection_status());
        logger.info(" Request Data : " + controlDetails.getRequest_data());
        //fetching the user details from the session.
        SessionDetails user = (SessionDetails) session.getAttribute("user");
        if (!controlDetails.getRequest_data().isEmpty() && !controlDetails.getProtection_status().isEmpty()) {
            boolean result = PROTECTION_STATUS.protectionStatusUpdate(controlDetails, user.getDomid().trim());
            if (result) {
                session.setAttribute("error", "Protection status has been updated");
                logger.info("Protection status has been updated ");
            } else {
                session.setAttribute("error", "Protection status not updated");
                logger.info("Protection status not updated ");

            }
        } else {
            session.setAttribute("error", "IP address is not registared or protection status is not selected.");
        }

        return "redirect:/control";
    }

    @RequestMapping(value = "/control-category", method = RequestMethod.GET)
    public String categoryListFirst(Locale locale, Model model, HttpSession session, @RequestParam(name = "error", required = false) String error) {

        if (session.getAttribute("user") == null) {
            return "redirect:/logout";
        } else {
            try {
                //fetching the user details from the session.
                SessionDetails user = (SessionDetails) session.getAttribute("user");
                CategoryList list = categoryimpl.getCategoryList(user.getActid() + RestConfig.ADVANCED_FILTER, user.getDomid().trim());
                model.addAttribute("CAT", list);
                model.addAttribute("uesr_name", user.getActname());
                session.setAttribute("error", error);
                //logger.info("List Blocked : " + list.getBlocked_catogery().toString());

            } catch (Exception ee) {
                logger.error("" + ee.getMessage());
            }
            return "control-category-list";
        }

    }

//    @RequestMapping(value = "/control-category/{protection-status}", method = RequestMethod.GET)
//    public String categoryList(Locale locale, Model model, @PathVariable(name = "protection-status", required = false) String protection_status, HttpSession session) {
//        if (session.getAttribute("user") == null) {
//            return "redirect:/logout";
//        } else {
//            try {
//                //fetching the user details from the session.
//                SessionDetails user = (SessionDetails) session.getAttribute("user");
//
//                CategoryList list = null;
//                if (protection_status.equals("basic")) {
//                    list = categoryimpl.getCategoryList("basic_filter_zeno", user.getDomid().trim());
//                } else if (protection_status.equals("advance")) {
//                    list = categoryimpl.getCategoryList("advance_filter_zeno", user.getDomid().trim());
//                } else if (protection_status.equals("custom")) {
//                    list = categoryimpl.getCategoryList(user.getActid() + "_filter_object", user.getDomid().trim());
//                }
//                model.addAttribute("uesr_name", user.getActname());
//                model.addAttribute("CAT", list);
//
//            } catch (Exception ee) {
//                logger.error("" + ee.getMessage());
//            }
//            return "control-category-list";
//        }
//    }
    //control-category
    /*  @RequestMapping(value = "/control-category", method = RequestMethod.POST)
    public String updateSategoryList(Locale locale, Model model, @ModelAttribute(name = "CAT")CategoryList list, HttpSession session,@RequestParam( name = "update_category") String select_update) {
        //fetching the user details from the session.
        SessionDetails user = (SessionDetails) session.getAttribute("user");

        if (categoryimpl.updateCategoryList(list.getBlock_list_data(), list.getAllow_list_data(), user.getDomid(), user.getActid(), select_update)) {
            model.addAttribute("error", "Updated succefuly");
        } else {
            model.addAttribute("error", "Updation failed");
        }
        return "redirect:/control-category";
    }
     */
    @RequestMapping(value = {"/scheduling"}, method = RequestMethod.GET)
    public String getAdvanceFilter(Locale locale, Model model, HttpSession session) {

        return "parental-control";
    }

    /**
     * @param categoryimpl the categoryimpl to set
     */
    public void setCategoryimpl(CategoryListDAOImpl categoryimpl) {
        this.categoryimpl = categoryimpl;
    }

}
