package com.prodevans.zeno.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Vector;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.springframework.beans.factory.annotation.Autowired;

import com.prodevans.zeno.dao.RcDAO;
import com.prodevans.zeno.pojo.RcDetails;

public class rcDAOImpl implements RcDAO {
	
	
	@Autowired
	private String unifyHandler;

	@Autowired
	private XmlRpcClient rpcClient;

	/**
	 * @param unifyHandler
	 *            the unifyHandler to set
	 */
	public void setUnifyHandler(String unifyHandler) {
		this.unifyHandler = unifyHandler;
	}

	/**
	 * @param rpcClient
	 *            the rpcClient to set
	 */
	public void setRpcClient(XmlRpcClient rpcClient) {
		this.rpcClient = rpcClient;
	}

	
	

	@Override
	public RcDetails getrcdetails(String actid, boolean getClosed, Date fromDate, Date toDate) throws XmlRpcException {
		
		RcDetails rcdetails= new RcDetails();
		Vector<Object> params = new Vector<Object>();
        params.add(actid);
        params.add(false);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
		
        Date date = formatter.parse("2017-06-06");
		params.add(date);
		params.add(new Date());
		
        Object[] token = (Object[]) rpcClient.execute("unify.getRCsForAccount", params);
        for (Object ob : token) {
			HashMap<String, Object> hs = (HashMap<String, Object>) ob;

			Iterator it = hs.entrySet().iterator();
		
			if (hs.isEmpty() == false) {
				   
				rcdetails.setAmount(hs.get("amount").toString()); 
				rcdetails.setBrcdesc(hs.get("brcdesc").toString());
				//System.out.println(rcdetails.toString());
				return rcdetails;
			} else {
				return null;
			}
		// TODO Auto-generated method stub
		
	}
        return rcdetails;
        }catch(Exception ee){
			//logger.error("No subscription found : " + ee.getMessage());
		}
		return rcdetails;

  }
}

