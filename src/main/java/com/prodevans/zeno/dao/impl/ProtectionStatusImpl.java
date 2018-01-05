/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.prodevans.zeno.dao.impl;

import com.prodevans.zeno.config.RestConfig;
import com.prodevans.zeno.dao.ProtectionStatusDAO;
import com.prodevans.zeno.pojo.ParentalControlDetails;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.Map;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author rajanikant
 */
public class ProtectionStatusImpl implements ProtectionStatusDAO {

    private RestTemplate restTemplate;
    private HttpEntity<String> entity;

    final static private Logger logger = LoggerFactory.getLogger(RegistrationUserParentalControlImpl.class);

    public ProtectionStatusImpl() {
        try {
            /**
             * Create a trust manager that does not validate certificate chains.
             * It required for the generating the SSL certificate. If not
             * provided then while connection it throws SSL certification error.
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

    /**
     * getProtectionDetails method is for getting the protection status from the
     * versa
     *
     * @param user_name
     * @return
     */
    @Override
    public ParentalControlDetails getProtectionDetails(String user_name, String domain_id) {
        ParentalControlDetails controlDetails = new ParentalControlDetails();
        /**
         * change the user name as per the requirements of business logic. user
         */
        user_name = user_name.trim() + "_access_policy_rule";

        /**
         * Creation of the response object with the string data type. Because it
         * return the JSON.
         */
        ResponseEntity<String> person;

        /**
         * Headers for the response type if we want to return JSON response then
         * we require to add.
         */
        HttpHeaders headers = new HttpHeaders();

        /**
         * Adding of the response header with application/json type
         */
        headers.add("Accept", "application/json");

        /**
         * Adding of the request header with application/json type
         */
        headers.setContentType(MediaType.APPLICATION_JSON);

        /**
         * Creation of the Entity object for the adding the headers and JSON
         * request body into request.
         */
        entity = new HttpEntity<>(headers);

        /**
         * Creation of REST TEMPLET object for the executing of the REST calls.
         */
        restTemplate = new RestTemplate();

        /**
         * Adding the basic type of authentication on the REST TEMPLETE.
         */
        restTemplate.getInterceptors()
                .add(new BasicAuthorizationInterceptor(RestConfig.USER_NAME, RestConfig.PASSWORD));

        /**
         * Execution of the REST call with basic authentication and JSON
         * response type
         */
        try {
            Map<String, String> map = new HashMap<String, String>();
            map.put("domain_id", domain_id);
            map.put("rule_object_name", user_name);
            person = restTemplate.exchange(RestConfig.SEARCH_RULE_OBJECT, HttpMethod.GET, entity, String.class, map);

            //status code 200 specify the address is already present.
            if (person.getStatusCodeValue() == 200) {
                logger.error("filter already exixts user_name : " + user_name);
                JSONObject obj = new JSONObject(person.getBody());
                String protection_status = obj.getJSONObject("access-policy").getJSONObject("set").getJSONObject("security-profile").getJSONObject("url-filtering").getString("user-defined");

                if (!protection_status.equals("advance_filter_zeno") && !protection_status.equals("basic_filter_zeno") && !protection_status.equals("elementary_filter_zeno")) {
                    controlDetails.setProtection_status("custom_filter");
                } else {
                    controlDetails.setProtection_status(protection_status);
                }
                //controlDetails.setProtection_status(protection_status);
                controlDetails.setRequest_data(person.getBody().toString());
            }
        } catch (RestClientException e) {
            logger.error(e.getMessage());

        }

        return controlDetails;
    }

    @Override
    public boolean protectionStatusUpdate(ParentalControlDetails controlDetails, String domain_id) {
        boolean result = false;

        /**
         * change the user name as per the requirements of business logic. user
         * name ex. OE_000007_address_object
         */
        String access_policy_rule = controlDetails.getUser_name().trim() + "_access_policy_rule";
        String filter_policy = "";

        if (!controlDetails.getProtection_status().contains("advance_filter_zeno") && !controlDetails.getProtection_status().contains("basic_filter_zeno") && !controlDetails.getProtection_status().contains("elementary_filter_zeno")) {
            filter_policy = controlDetails.getUser_name().trim() + "_filter_object";
        } else {
            filter_policy = controlDetails.getProtection_status().trim();
        }

        /**
         * Creation of the response object with the string data type. Because it
         * return the JSON.
         */
        ResponseEntity<String> person;

        /**
         * Headers for the response type if we want to return JSON response then
         * we require to add.
         */
        HttpHeaders headers = new HttpHeaders();

        /**
         * Adding of the response header with application/json type
         */
        headers.add("Accept", "application/json");

        /**
         * Adding of the request header with application/json type
         */
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Json data for the update rule.
        JSONObject obj = new JSONObject(controlDetails.getRequest_data());
        JSONObject new_data = obj.getJSONObject("access-policy").getJSONObject("set").getJSONObject("security-profile").getJSONObject("url-filtering").put("user-defined", filter_policy);
        logger.info("Request Data  :" + new_data.toString());

        /**
         * Creation of the Entity object for the adding the headers and JSON
         * request body into request.
         */
        entity = new HttpEntity<>(obj.toString(), headers);

        /**
         * Creation of REST TEMPLET object for the executing of the REST calls.
         */
        restTemplate = new RestTemplate();

        /**
         * Adding the basic type of authentication on the REST TEMPLETE.
         */
        restTemplate.getInterceptors()
                .add(new BasicAuthorizationInterceptor(RestConfig.USER_NAME, RestConfig.PASSWORD));

        /**
         * Execution of the REST call with basic authentication and JSON
         * response type
         */
        try {
            Map<String, String> map = new HashMap<String, String>();
            map.put("domain_id", domain_id);
            map.put("rule_object_name", access_policy_rule);
            person = restTemplate.exchange(RestConfig.UPDATE_RULE_OBJECT, HttpMethod.PUT, entity, String.class, map);

            //status code 200 specify the address is already present.
            if (person.getStatusCodeValue() == 204) {
                return true;
            } else {
                return false;
            }
        } catch (RestClientException e) {
            logger.error(e.getMessage());
            return false;
        }

    }

}
