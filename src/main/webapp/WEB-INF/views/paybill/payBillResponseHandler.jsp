<%@page import="com.prodevans.zeno.dao.impl.PaymentResponseDAOImpl"%>
<%@page import="com.prodevans.zeno.dao.impl.PaymentDAOImpl"%>
<%@page import="com.prodevans.zeno.pojo.PaymentDetails"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URL"%>

<%@page import="org.apache.xmlrpc.client.XmlRpcClient"%>
<%@page import="org.apache.xmlrpc.client.XmlRpcClientConfigImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.io.*,java.util.*,com.ccavenue.security.*" %>
<html>
        <meta charset="utf-8">
        <title>ONE8</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta content="ONE8 User Portal" name="description">
        <meta content="ONE8 User Portal Keywords" name="keywords">
       

        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">


        <!--  include the all css components -->
        <jsp:include page="../component/css.jsp"></jsp:include>

</head>
        <body class="corporate">
            <!-- BEGIN HEADER -->
            <div class="header">
                <div class="container">
                    <a class="site-logo" href="#">
                        <img src="corporate/img/logos/logo.png" alt="ONE8"> </a>
                    <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>
                    <!-- BEGIN NAVIGATION -->
                    <div class="header-navigation pull-right font-transform-inherit" style="font-size:12px">
                        <ul>
                            <li class="dropdown active"> </li>
                            <li ><a href="${pageContext.request.contextPath }/dashboard">Home</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath }/billingPayment">Make Payment</a></li>  
                        <li><a href="${pageContext.request.contextPath }/service">Service Request</a></li>  
                        <li><a href="${pageContext.request.contextPath }/parental-control">Parental Control</a></li>
                        <li><a href="${pageContext.request.contextPath }/profile">Profile</a></li>
                        <li><a href="${pageContext.request.contextPath }/logout">Logout</a></li>
                    </ul>
                </div>
                <!-- END NAVIGATION -->
            </div>
        </div>
        
<%
		String workingKey = "399EEF58D17B77592F4B745B83B06CED";		//32 Bit Alphanumeric Working Key should be entered here so that data can be decrypted.
		String encResp= request.getParameter("encResp");
		AesCryptUtil aesUtil=new AesCryptUtil(workingKey);
		String decResp = aesUtil.decrypt(encResp);
		StringTokenizer tokenizer = new StringTokenizer(decResp, "&");
		Hashtable hs=new Hashtable();
		String pair=null, pname=null, pvalue=null;
		while (tokenizer.hasMoreTokens()) {
			pair = (String)tokenizer.nextToken();
			if(pair!=null) {
				StringTokenizer strTok=new StringTokenizer(pair, "=");
				pname=""; pvalue="";
				if(strTok.hasMoreTokens()) {
					pname=(String)strTok.nextToken();
					if(strTok.hasMoreTokens())
						pvalue=(String)strTok.nextToken();
					hs.put(pname, URLDecoder.decode(pvalue));
				}
			}
		}
		PaymentResponseDAOImpl prdi=new PaymentResponseDAOImpl();
	    HashMap<String, String> responseFromCCAvenue= new HashMap<>();
		
	    Enumeration enumeration = hs.keys();
		while(enumeration.hasMoreElements())
		{
			pname=""+enumeration.nextElement();
			pvalue=""+ hs.get(pname);
			responseFromCCAvenue.put(pname, pvalue);
		}
		
		PaymentDetails pd=(PaymentDetails)session.getAttribute("data");
		boolean success=false;
		if(responseFromCCAvenue.get("order_status").equals("Success"))
		{
			
			Vector<Object> params = new Vector<>();
			
			params.add(pd.getActno());
			params.add(pd.getTrans_amount());
			
			if(responseFromCCAvenue.get("payment_mode").contains("Debit Card"))
			{
				params.add("D");
				params.add(new Date());
				params.add(pd.getCurrency());
				params.add(9);
				params.add("Debit Card");
				params.add(pd.getTrans_descr());
				out.println("<h1>All value set to param</h1><br>");
			}
			if(responseFromCCAvenue.get("payment_mode").contains("Credit Card"))
			{
				params.add("C");
				params.add(new Date());
				params.add(pd.getCurrency());
				params.add(8);
				params.add("Credit Card");
				params.add(pd.getTrans_descr());
			}
			
			//params.add(pd.getTrans_type());
			//params.add(new Date());
			//params.add(pd.getCurrency());
			//params.add(pd.getInstrumentid());
			//params.add(pd.getInstrument_detail());
			//params.add(pd.getTrans_descr());
			

			String server_url = "http://52.172.205.76/unifyv3/xmlRPC.do";
			URL serverUrl = new URL(server_url);
			// Create an object to represent our server.
			XmlRpcClient server = new XmlRpcClient();
			XmlRpcClientConfigImpl conf = new XmlRpcClientConfigImpl();
			conf.setBasicUserName("oneeight");
			conf.setBasicPassword("!oneight@#");
			conf.setServerURL(serverUrl);
			
			server.setConfig(conf);
			Object o=(Object) server.execute("unify.addTransaction",params);
			int Transaction_id=(int)o;
			pd.setTransaction_id(Transaction_id);
			success=true;
		}


if(success)
{
%>
		
    <div class="row">
        <div class="col-md-4 firstRow billPaymentImage">
            <h1 style="color: white; margin-left: 15%;" class="pt-40">Bill payment</h1>
        </div>
        <div class="col-md-8 firstRow" style="background-color: #ecf0f1;">
            <div class="col-md-10 col-sm-10">
                <h1 style="color: black;" class="currentBillFontforiPhone5 pt-40">
                	Your transaction was successful.
                </h1>
            </div>
            <div class="col-md-2 col-sm-2">
               <img class="paymentImageSize pt-20" alt="Check Image" src="corporate/img/check.png">
            </div>
        </div>
    </div>
    
	<div class="container">
	    <div class="row col-md-12">
	        <div class="col-md-4">
	        </div>
	        <div class="col-md-8">
	            <div class="mainBlock3" style="background-color: #2980b9;">
	                <h3 class="pb-40">Payment Summary</h3>
	                <h2 class="pb-40">Your payment of &#8377;. <%=responseFromCCAvenue.get("amount") %>/- was successful.</h2>
	                <h5>TRANSACTION ID</h5>
	                <h3><%=pd.getTransaction_id() %></h3>
	            </div>
	        </div>
	    </div>
	</div>
<%
}
else
{
%>
   <div class="row">
        <div class="col-md-4 firstRow billPaymentImage">
            <h1 style="color: white; margin-left: 15%;" class="pt-40">Bill payment</h1>
        </div>
        <div class="col-md-8 firstRow" style="background-color: #ecf0f1;">
            <div class="col-md-10 col-sm-10">
                <h1 style="color: black;" class="currentBillFontforiPhone5 pt-40">
                	Your transaction was unsuccessful.
                </h1>
            </div>
            <div class="col-md-2 col-sm-2">
               <img class="paymentImageSize pt-20" alt="Check Image" src="corporate/img/cross1.png">
            </div>
        </div>
    </div>
    
	<div class="container">
	    <div class="row col-md-12">
	        <div class="col-md-4">
	        </div>
	        <div class="col-md-8">
	            <div class="mainBlock3" style="background-color: #2980b9;">
	                <h3 class="pb-40">Payment Summary</h3>
	                <h2 class="pb-40">Your payment of &#8377;. <%=responseFromCCAvenue.get("amount") %>/- was unsuccessful.</h2>
	                <h5>REASON</h5>
	                <h3><%=responseFromCCAvenue.get("status_message") %></h3>
	            </div>
	        </div>
	    </div>
	</div>
<%
}
%>
	
	
        <jsp:include page="../component/pop-up.jsp"></jsp:include>
            
        <jsp:include page="../component/footer.jsp"></jsp:include>    
            
            
            <!-- Load javascripts at bottom, this will reduce page load time -->
        <jsp:include page="../component/js.jsp"></jsp:include>
        <!-- END BODY -->
    </body>
</html>