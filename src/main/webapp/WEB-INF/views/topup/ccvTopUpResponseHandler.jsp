<%@page import="com.prodevans.zeno.pojo.TopUpPaymentDetails"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URL"%>

<%@page import="org.apache.xmlrpc.client.XmlRpcClient"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
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
        <meta content="vikram" name="author">

        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">


        <!--  include the all css components -->
        <jsp:include page="../component/css.jsp"></jsp:include>
       

</head>

<style type="text/css">

.row
{
	margin: unset;
}
.mainBlock3
{
	max-height: 105% !important;
	min-height: 105% !important;
	margin-top: 7% !important;
	margin-bottom: 7% !important;
}

.col-md-7, .col-md-6, .col-sm-6  
{
	padding-left: 1px !important;
	padding-right: 1px !important;
}

.pt-20M
{
	padding-top: 10px;
}
.pt-20I
{
	padding-top: 10px;
}
@media ( max-width : 680px) 
{
  	.mainBlock3
  	{
  		width: 90% !important;
  		min-height: 80% !important;
  	}
  	.pt-20M
	{
		padding-top: 1px;
	}
	.pt-20I
	{
		padding-top: 30px;
	}
	.col-xs-12, .col-md-8  
	{
    	 padding-left: 1px !important;
    	 padding-right: 1px !important;
  	}
}
@media (max-width:900px) and (min-width:680px)
{	
	.col-xs-12, .col-md-8  
	{
    	 padding-left: 1px !important;
  	}
  	.mainBlock3
  	{
  		width: 90% !important;
  		min-height: 140% !important;
  	} 	
}

.firstRow
{
     background-image: url('img/blue_small.png');
     padding-left: 4.8% !important;
     min-height: 116px;
     background-size: cover;
}
.col-md-1
{
	padding-left: 1px !important;
}

</style>

<body class="corporate" style="font-family: Roboto;">
          
<!--  include menubar -->
<jsp:include page="../component/menubar.jsp"></jsp:include>	
        
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

	    HashMap<String, String> responseFromCCAvenue= new HashMap<>();
		
	    Enumeration enumeration = hs.keys();
		while(enumeration.hasMoreElements())
		{
			pname=""+enumeration.nextElement();
			pvalue=""+ hs.get(pname);
			responseFromCCAvenue.put(pname, pvalue);
		}
		//Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		TopUpPaymentDetails pd=(TopUpPaymentDetails)session.getAttribute("data");
		boolean success=false;
		Boolean sendCustomer=false;
		Boolean sendOE=false;
		
		if(responseFromCCAvenue.get("order_status").equals("Success"))
		{
			try
			{
							
				Vector<Object> params = new Vector<>();
				
				/*For Sednding Mails Start*/
				Vector<Object> paramsCustomer = new Vector<>();
				paramsCustomer.add("You have requested for and Add on, your request is under process.");
				paramsCustomer.add("Subject");
				paramsCustomer.add(responseFromCCAvenue.get("billing_email"));
				paramsCustomer.add(1);
				
				Vector<Object> paramsOE = new Vector<>();
				paramsOE.add("Message");
				paramsOE.add("Request for Add On");
				paramsOE.add("suguna@oneeight.co.in");
				paramsOE.add(1);
				/*For Sednding Mails Start*/
				
				params.add(pd.getActno());
				params.add(pd.getTrans_amount());
				params.add(pd.getTrans_type());
				params.add(new Date());
				params.add(pd.getCurrency());
				params.add(pd.getInstrumentid());
				params.add(pd.getInstrument_detail());
				params.add(pd.getTrans_descr());

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
				
				sendCustomer=(Boolean)server.execute("unify.sendMail",paramsCustomer);
				sendOE=(Boolean)server.execute("unify.sendMail",paramsOE);
				
				success=true;
				
			}
			catch(Exception e)
			{
				out.println("<h6>Exception : "+e+"<h6>");
			}
		}


if(success)
{
%>
<div class="col-md-4 col-sm-12  firstRow pt-20">
	<h1 style="color: white; ">Bill payment</h1>
</div>

<div class="col-md-8 col-sm-12 " style="background-color: #ecf0f1;min-height: 116px;">
	<div class="col-md-12 col-xs-11 pt-20M ">
		<div class="col-xs-10">
			<h1 style="color: black;" class="currentBillFontforiPhone5">
	        Your transaction was successful</h1>
	    </div>
	    <div class="col-xs-2"> 
	        <img class="paymentImageSize pt-20I" alt="Check Image" src="corporate/img/check.png">
		</div>	
	</div>
</div>

<div class="container ">
        <div class="col-md-4">
        </div>
        <div class="col-md-8 col-xs-12">
            <div class="mainBlock3" style="background-color: #2980b9;">
                <h3 class="pb-40">Payment Summary</h3>
                <h2 class="pb-40">Your payment of &#8377;. <%=responseFromCCAvenue.get("amount") %>/- was successful</h2>
                <h5>TRANSACTION ID</h5>
                <h3><%=pd.getTransaction_id() %></h3>
                
                <form action="viewReceipt" method="post">
	            	<input type="hidden" value="<%=pd.getTransaction_id() %>" name="trans_id">
	            	<button class="btn billButton" type="submit">VIEW RECEIPT</button>
	            </form>
            </div>
        </div>
</div>		
<%
}
else
{
%>
<div class="col-md-4 col-sm-12  firstRow pt-20">
	<h1 style="color: white; ">Bill payment</h1>
</div>

<div class="col-md-8 col-sm-12 " style="background-color: #ecf0f1;min-height: 116px;">
	<div class="col-md-12 col-xs-11 pt-20M ">
		<div class="col-xs-10">
			<h1 style="color: black;" class="currentBillFontforiPhone5">
	        Your transaction was unsuccessful</h1>
	    </div>
	    <div class="col-xs-2"> 
	        <img class="paymentImageSize pt-20I" alt="Check Image" src="corporate/img/cross1.png">
		</div>	
	</div>
</div>

<div class="container ">
        <div class="col-md-4">
        </div>
        <div class="col-md-8 col-xs-12">
            <div class="mainBlock3" style="background-color: #2980b9;">
                <h3 class="pb-40">Payment Summary</h3>
                <h2 class="pb-40">Your payment of &#8377;. <%=responseFromCCAvenue.get("amount") %>/- was unsuccessful</h2>
                <h5>REASON</h5>
                <h3><%=responseFromCCAvenue.get("status_message")%></h3>
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