<%@page import="com.prodevans.zeno.dao.impl.PaymentResponseDAOImpl"%>
<%@page import="com.prodevans.zeno.dao.impl.PaymentDAOImpl"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.List" %>

<%@page import="org.apache.xmlrpc.client.XmlRpcClient"%>
<%@page import="org.apache.xmlrpc.client.XmlRpcClientConfigImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,com.ccavenue.security.*" %>

<%
boolean success=false;
String res;
	
int transaction_id=Integer.parseInt(request.getParameter("trans_id"));
System.out.println(transaction_id);

	Vector<Object> params = new Vector<>();
	
	params.add(transaction_id);
	
	String server_url = "http://52.172.205.76/unifyv3/xmlRPC.do";
	URL serverUrl = new URL(server_url);
	// Create an object to represent our server.
	XmlRpcClient server = new XmlRpcClient();
	XmlRpcClientConfigImpl conf = new XmlRpcClientConfigImpl();
	conf.setBasicUserName("oneeight");
	conf.setBasicPassword("!oneight@#");
	conf.setServerURL(serverUrl);
	
	server.setConfig(conf);
	Object o=(Object) server.execute("unify.getReceipt",params);
	res = (String)o;
	
	success=true;
	

%>
<%=res %>


