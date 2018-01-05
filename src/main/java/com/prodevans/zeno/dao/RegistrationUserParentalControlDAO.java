package com.prodevans.zeno.dao;

public interface RegistrationUserParentalControlDAO {

    String getUserList();

    boolean checkRegistration(String user_name, String domain_id, String ip_address_inventum);

    boolean registerUser(String user_name, String ip_address, String domain_id);
}
