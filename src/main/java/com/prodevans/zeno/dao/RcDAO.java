/**
 * 
 */
package com.prodevans.zeno.dao;

import java.util.Date;

import org.apache.xmlrpc.XmlRpcException;

import com.prodevans.zeno.pojo.RcDetails;

/**
 * @author siddu
 *
 */
public interface RcDAO {
	
	public RcDetails getrcdetails(String actid, boolean getClosed, Date fromDate, Date toDate) throws XmlRpcException;

}
