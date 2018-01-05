/*
 * 
 */
package com.prodevans.zeno.pojo;

/**
 *
 * @author rajanikant
 */
public class ParentalControlDetails {
    private String protection_status;
    private String user_name;
    private String request_data;
   
    public ParentalControlDetails(){
        protection_status = "";
        user_name = "";
        request_data = "";
    }
    
    
    /**
     * @return the protection_status
     */
    public String getProtection_status() {
        return protection_status;
    }

    /**
     * 
     */
    public String getProtectionStatusName(){
        if(protection_status.equals("elementary_filter_zeno")){
            return "ELEMENTRY";
        }
        else if(protection_status.equals("basic_filter_zeno")){
            return "DEFAULT";
        }
       else if(protection_status.equals("advance_filter_zeno")){
            return "ADVANCED";
        }
       else if(protection_status.equals("custom_filter")){
            return "CUSTOM";
        }
       else{
           return "NOT SELECTED";
       }
    }
    
    /**
     * @param protection_status the protection_status to set
     */
    public void setProtection_status(String protection_status) {
        this.protection_status = protection_status;
    }

    /**
     * @return the request_data
     */
    public String getRequest_data() {
        return request_data;
    }

    /**
     * @param request_data the request_data to set
     */
    public void setRequest_data(String request_data) {
        this.request_data = request_data;
    }

    /**
     * @return the user_name
     */
    public String getUser_name() {
        return user_name;
    }

    /**
     * @param user_name the user_name to set
     */
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    
}
