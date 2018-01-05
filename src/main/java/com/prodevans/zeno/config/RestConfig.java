package com.prodevans.zeno.config;

/*
 * Rest configuration file is created for the store Global configuration 
 * of the Versa director.
 * Created by : RK
 */
public interface RestConfig {

    /**
     * URL of the Versa for fetch the REST API.
     */
    String URL = "https://52.172.187.91";

    /**
     * PORT for the access the REST API
     */
    String PORT = "9182";

    /**
     * Created the HOST that have the URL:PORT for easy access of host name.
     */
    String HOST = URL + ":" + PORT;

    /**
     * USER NAME of the access API.
     */
    String USER_NAME = "Administrator";

    /**
     * PASSWORD for t
     */
    String PASSWORD = "Oneeight@admin18";

    
    /**
     * Advanced Filter
     */
    String ADVANCED_FILTER = "_advanced_filter";
    
    /**
     * Custom Filter
     */
    String CUSTOM_FILTER = "_custom_filter";
    
    
    /**
     * API url for get the address object list.
     */
    String GET_ADDRESS_OBJECT_LIST = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/objects/addresses/address";

    /**
     * API url for create the address object.
     */
    String CREATE_ADDRESS_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/objects/addresses";

    /**
     * API url for create the filter policy object.
     */
    String CREATE_POLICY_FILTER_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/profiles/url-filtering";

    /*
        *  API url for create the access policy rule object.
     */
    String CREATE_RULE_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules";

    /**
     * API URL for find address object.
     */
    String SEARCH_ADDRESS_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/objects/addresses/address/{address_object_name}";

    /**
     * API URL for get list of objects.
     */
    String LIST_ACCESS_RULE = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules/access-policy";

    /**
     * API URL for rearranging the rules.
     */
    String REORDER_RULE_LIST = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules";

    /**
     * API URL for find RULE object.
     */
    String SEARCH_RULE_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules/access-policy/{rule_object_name}";

    /**
     * API URL for find RULE object.
     */
    String UPDATE_RULE_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules/access-policy/{rule_object_name}";

    /**
     * API URL for list URL category these blocked by the filter.
     */
    String URL_CATEGORY_LIST_PROTECTION_LEVEL = HOST + "/api/config/appliances/{domain_id}/orgs/org-services/OneEight/security/profiles/url-filtering/url-filtering-profile/{protection_status}/category-action-map/category-action";

    /**
     * API URL for edit category list with specific filter.
     */
    String EDIT_URL_CATEGORY_LIST = HOST + "/api/config/appliances/{domain_id}/orgs/org-services/OneEight/security/profiles/url-filtering/url-filtering-profile/{filter_name}/category-action-map/category-action/{map_name}";

    /**
     * API URL for search filter object.
     */
    String SEARCH_FILTER_OBJECT = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/profiles/url-filtering/url-filtering-profile/{filter_name}";

    /**
     * API URL for get list of predefined category.
     */
    String LIST_PREDEFINED_CATEGORY = HOST + "/api/config/nms/provider/predefined/url-categories/url-category";

    
    /**
     * API URL for updating profile filter
     */
    String EDIT_PROFILE_FILTER = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/profiles/url-filtering/url-filtering-profile/{filter_name}";

    
    /**
     * API URL for creating daily schedule
     */
    String CREATE_SCHEDULE = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/objects/schedules/schedule/{schedule_name}";
    
    
    /**
     * API URL for searching access policy rule
     */
    String SEARCH_ACCESS_POLICY_RULE = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules/access-policy/{policy_rule_name}";

    
    /**
     * API URL for updating access policy rule
     */
    String UPDATE_ACCESS_POLICY_RULE = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/security/access-policies/access-policy-group/Default-Policy/rules/access-policy/{policy_user}";

    
    
    /**
     * API URL for updating IP Address
     */
    String UPDATE_IP_ADDRESS = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/objects/addresses/address/{address_object_name}";
    
    
    /**
     * API URL for getting schedule status
     */
    String SCHEDULE_STATUS = HOST + "/api/config/devices/device/{domain_id}/config/orgs/org-services/OneEight/objects/schedules/schedule/{schedule_object}?deep=true";
    
    
    
    
}
