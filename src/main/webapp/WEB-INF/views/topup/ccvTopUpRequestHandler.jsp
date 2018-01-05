<%@page import="com.prodevans.zeno.pojo.TopUpPaymentDetails"%>
<%@page import="com.prodevans.zeno.pojo.PaymentDetails"%>
<%@page import="java.net.URLEncoder"%>
<%
/*
   This is the sample Checkout Page JSP script. It can be directly used for integration with CCAvenue if your application is developed in JSP. You need to simply change the variables to match your variables as well as insert routines (if any) for handling a successful or unsuccessful transaction.
*/
%>
<%@ page import = "java.io.*,java.util.*,com.ccavenue.security.*" %>
<html>
<head>
	<title>Sub-merchant checkout page</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

</head>
<body>
	<%

	TopUpPaymentDetails pd=new TopUpPaymentDetails();
	pd.setActno(Integer.parseInt(request.getParameter("actno")));
	pd.setTrans_amount(Double.parseDouble(request.getParameter("trans_amount")));
	
	
	if((request.getParameter("instrument_detail"))!=null)
	{
		String instrument_detail=request.getParameter("instrument_detail");
		String d[]=instrument_detail.split(",");
		pd.setInstrumentid(Integer.parseInt(d[0]));
		pd.setInstrument_detail(d[1]);
	}
	else
	{
		pd.setInstrumentid(10);
		pd.setInstrument_detail("N/A");
	}
	pd.setTrans_type(request.getParameter("trans_type"));
	pd.setTrans_date(new Date());
	pd.setCurrency(request.getParameter("currency"));	
	pd.setTrans_descr(request.getParameter("trans_descr"));
	
	
	session.setAttribute("data",pd);
	
	
	 String accessCode= "AVQZ69EC67BC82ZQCB";		//Put in the Access Code in quotes provided by CCAVENUES.
	 String workingKey = "399EEF58D17B77592F4B745B83B06CED";    //Put in the 32 Bit Working Key provided by CCAVENUES.  
	 Enumeration enumeration=request.getParameterNames();
	 String ccaRequest="", pname="", pvalue="";
	 while(enumeration.hasMoreElements()) {
	      pname = ""+enumeration.nextElement();
	      pvalue = request.getParameter(pname);
	      ccaRequest = ccaRequest + pname + "=" + URLEncoder.encode(pvalue,"UTF-8") + "&";
	 }
	 AesCryptUtil aesUtil=new AesCryptUtil(workingKey);
	 String encRequest = aesUtil.encrypt(ccaRequest);
	%>
	
	<form id="nonseamless" method="post" name="redirect" action="https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction"/> 
		<input type="hidden" id="encRequest" name="encRequest" value="<%= encRequest %>">
		<input type="hidden" name="access_code" id="access_code" value="<%= accessCode %>">
		<script language='javascript'>document.redirect.submit();</script>
	</form>
	
 </body> 
</html>
