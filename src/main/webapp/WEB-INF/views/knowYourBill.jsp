<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>

<html>
<head>
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
<jsp:include page="component/css.jsp"></jsp:include>

<style type="text/css">
h1{
	margin:unset;
	padding-top:30px;
}

.mainBlock
{
	color:black;
	width: 90%;
	min-height:70%;
	margin-top: 5%;
	margin-left:5%;
	margin-bottom: 5%;	
	padding:4%;
	-webkit-box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
	-moz-box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
	box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
}
@media (max-width : 650px) 
{
	.paddingLeftMobile
	{
		padding-left: 40px;
	}

}
</style>

</head>

<body class="corporate" style="font-family: Roboto;">


    
<div class="container1">
    
    	<div class="col-md-1">
    		
    	</div>
        <div class="col-md-10 ">
        	<div class="col-md-10"></div>
        	<div class="col-md-2">
	            <a href="dashboard" class="btn billButton ">My One8</a>
	        </div>
            
            <div class="mainBlock">
            	
            	<div class="row">
            		<div class="col-md-6">
            			<img alt="ONE EIGHt" height="80" src="corporate/img/logos/logo.png" width="110"  style="margin-top:20px;margin-left: 30px;"/>
            		</div>
            		<div class="col-md-6">
            			<h1 style="padding-left:20px;">Amount: &#8377; ${invoiceDetails.getAmount() }</h1>
            		</div>
            	</div>
            	<div class="pb-40">
            	</div>
            	<div class="row pb-20" style="padding-left:40px;">
            	
	            	<div class="col-md-6" >
	            		<h4>${user_details.getFirst_name() }</h4>
	            		<h4>${user_details.getAddress() }</h4>
	            		<h4>${user_details.getCityname() }</h4>
	            		<h4>Email ID: ${user_details.getEmail() }</h4>
	            		<h4>Mobile: ${user_details.getMobileno() }</h4>
	            	</div>
	            	<div class="col-md-6" style=" overflow-y: scroll">
	            		<table class="table table-responsive table-bordered">
	            			<tr><td>Account ID</td><td>${user_details.getActid() }</td></tr>
	            			<tr><td>Bill Period</td><td>${SubscriptionDetails.getStartdt() } -
							${SubscriptionDetails.getExpirydt() }</td></tr>
							<tr><td>Plan Name</td><td>${SubscriptionDetails.getRatePlan() }</td></tr>
	            		</table>
	            	</div>
	            	
	            </div>
	            
	            <div class="row" style="padding-left:50px;">
	            	<h5>*Note:</h5>
	            	<h4 style="padding-left:30px;">Payable amount is inclusive with all taxes</h4>
	            	<h4 style="padding-left:30px;">Tax ( CGST:9%+ SGST:9%= 18.0% ) </h4>
	            </div>
            	
			
            </div>
        </div>
        <div class="col-md-1"></div>
        
</div>



</body>
</html>