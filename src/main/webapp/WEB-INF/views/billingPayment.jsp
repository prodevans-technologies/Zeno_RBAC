<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>ONE8</title>

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">

        <link href="https://fonts.googleapis.com/css?family=Roboto:300"
              rel="stylesheet">

        <jsp:include page="component/css.jsp"></jsp:include>
        
        <jsp:include page="component/parental_check_js.jsp"></jsp:include>


            <style type="text/css">
                .mainBlock4
                {
                    margin-top: 15%;
                }
                .firstRow
                {
                    background-image: url('img/blue_small.png');
                    padding-left: 4.8%;
                    min-height: 116px;
                    background-size: cover;
                }
                .billButton
                {
                    width: 40%;
                     padding-right: 4.8%;
                }
                .pdl
                {
                    margin-top: 1.5%;
                }
                /* iphone 6 plus*/
                @media ( max-width : 530px) 
                {
                    .pbForProgress
                    {
                        margin-top: 15px;
                    }
                    .col-md-8
                    {
                        padding-left: 10px !important;
                    }
                }
                @media ( max-width : 992px) 
                {
                    h1
                    {
                        padding-top: 20px;
                    }
                    .pt-20M
                    {
                        padding-top: 1px;
                    }
                    .mainBlock4
                    {
                        max-width: 98% !important;
                        margin-top: 5%;
                    }

                    .pdl
                    {
                        padding-left: 23px;
                        margin-top: 0.8% !important;
                    }
                    .billButton
                    {
                        width: 115px !important;
                        margin-top: 1% !important;
                    }
                    .col-md-8 , .col-sm-12
                    {
                        padding-left: 2.5%;
                    }
                    .pdlADJ
                    {
                        padding-left: 2.4%;
                    }
                }
                @media ( max-width : 1207px) 
                {
                    .pdl
                    {
                        margin-top: 2%;
                    }
                }
                @media ( max-width :1279px) and (min-width:1024px) 
                {
                    h4
                    {
                        font-size: 16px !important;
                    }
                    .pb-30
                    {
                        padding-bottom: 8px !important;
                    }

                }

				@media ( max-width :1366px) and (min-width:1278px) 
                {
                	.pb-30
                    {
                        padding-bottom: 12px !important;
                    }
                    .pb1024
                    {
                    	padding-bottom: 14px !important;
                    }
                
                }
                
                .mainBlock41
				{
					box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
			}

            </style>

        </head>
        <body class="corporate">


            <!-- BEGIN HEADER -->
            <div class="header">
                <div class="row">
                    <a class="site-logo" href="${pageContext.request.contextPath }/dashboard"> <img
                            src="corporate/img/logos/logo.png" alt="ONE8">
                    </a> <a href="javascript:void(0);" class="mobi-toggler"><i
                            class="fa fa-bars"></i></a>
                    <!-- BEGIN NAVIGATION -->
                    <div class="header-navigation pull-right font-transform-inherit"
                         style="font-size: 12px">
                        <ul>
                            <li class="dropdown active"></li>
                            <li><a href="${pageContext.request.contextPath }/dashboard">MY ONE8</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath }/billingPayment">PAY YOUR BILL </a></li>
                        <li><a href="${pageContext.request.contextPath }/control">SURF
                            SAFE</a></li>
                        <li><a href="${pageContext.request.contextPath }/service">SERVICE</a></li>

                        <li><a href="${pageContext.request.contextPath }/profile">PROFILE</a></li>
                        <li><a href="${pageContext.request.contextPath }/logout">LOGOUT</a></li>
                    </ul>
                </div>
                <!-- END NAVIGATION -->
            </div>
        </div>
        <!-- Header END -->


        <div class="col-md-4 col-sm-12  firstRow pt-20">
            <h1 style="color: white; " class="pdlADJ">Bill payment</h1>
        </div>

        <div class="col-md-8 col-sm-12 pt-20 pt-20M" style="background-color: #ecf0f1;min-height: 116px;">
            <div class="col-md-8 col-sm-12">

                <h1 style="color: black;" class="currentBillFontforiPhone5">
                    Current bill &#8377; ${invoiceDetails.getAmount() }
                </h1>

            </div>
            <div style="padding-right: 5%;margin-bottom: -20px;margin-top: -10px;text-align:right;">
            <b style="float: right">${user_details.getActname()}<br/>${user_details.getActid() }</b><br/>
           <!--   <h4 style="float: right">${user.getActid()}</h4>-->
        
         <!--     <div class=" col-md-4 col-sm-12 pdl ">

                <a href="viewBill" class="btn billButton mainBlock41" target="_blank" > VIEW BILL </a> 
                <a href="payment" class="btn billButton mainBlock41"> PAY BILL </a> -->

            </div>

        </div>



        <div class="container " style="">
            <div style="margin-bottom: 4%;">
<div class="col-md-2 col-sm-3"></div>

                <div class="col-md-4  col-sm-6" >
                    <div class="mainBlock4 mainBlock41" style="background-color: #2980b9;">
                        <h3 class="pb-20">Your current plan</h3>
                        <h4>Plan Name: ${SubscriptionDetails.getRatePlan() }</h4>
                        <h4 class="pb-20">&#8377; ${amount} per Month</h4>
                        <h4>Plan Content</h4>
                        <h4>1. ${SubscriptionDetails.getFUPLimit() }GB Data</h4>
                        <h4>2. 512Kbps Post FUP Speed Data</h4>
                        
                        
                    </div>
                    <div align="right" style="color: #2980b9; padding-right:28px;" >
                     <a href="viewBill " class="btn billButton1 mainBlock41" "target="_blank" > VIEW BILL </a> </div>
                </div>


                <!--  <div class="col-md-4 col-sm-6">
                    <div class="mainBlock4" style="background-color: #ffb81c;">
                        <h3 class="pb-20" style="color: black;">Your One8 account</h3>
                        <h4 style="color: black;">Account ID :
                            ${user_details.getActid() }</h4>
                        <h4 style="color: black;" >Bill period : </h4>
                        <h4 style="color: black;" class="pb-30">${SubscriptionDetails.getStartdt() }-${SubscriptionDetails.getExpirydt() }</h4>
                        <div  style="margin-bottom: 7px;">
                            <span class="blackShadow font-h4" style="color: black;margin-right: 10px;">Usage</span>


                            <span class="blackShadow font-h2" style="color: black;">
                                ${SubscriptionDetails.getDataUsed() }GB</span>

                        </div>
                        <!-- <div class=" progress">
                            <div class="progressbarColor"
                                 style="width: ${SubscriptionDetails.getDataPercent()}%;"></div>
                        </div>

                    </div>
                </div>-->


                <div class="col-md-4 col-sm-6">
                    <div class="mainBlock4 mainBlock41" style="background-color: #F44336;">
                        <h3 class="pb-20">Payment</h3>
                      <!--   <h4 >A/C Name : ${user_details.getActname() }</h4>
                        <h4 >A/C ID : ${user_details.getActid() }</h4>--> 
                        <h2> &#8377; ${invoiceDetails.getAmount() }</h2>
                        <!--  <h2 class="pb-20 pb1024">Due in ${invoiceDetails.getRemainingDays() }
                            days</h2>
                             <h3 class="pb-20 pb1024"> Usage: ${SubscriptionDetails.getDataUsed() } GB</h3>-->
                              	<span class="blackShadow font-h2" style="color: white;">
                               Usage 
                                 ${SubscriptionDetails.getDataUsed() }
                                </span>GB
                                <h3 class="pb-20 pb1024"> </h3>
                              <div class=" progress">
                            	<div class="progressbarColor"
                                 style="width: ${SubscriptionDetails.getDataPercent()}%;"></div>
                        		</div>
                             <h2 class="pb-20 pb1024"></h2>
                            
                        <h4 style=text->Due Date: ${invoiceDetails.getDuedt() }</h4>

                    </div>
                    <div align="right" style="padding-right:28px" >
                	<a href="payment " class="btn billButton2 mainBlock41 "> PAY BILL </a></div>
                </div>
                
                <div class="col-md-2 col-sm-3"></div>
            </div>
        </div>





        <!-- included pop up -->
        <jsp:include page="component/pop-up.jsp"></jsp:include>

            <div style="margin-bottom:  3%;"></div>
        <jsp:include page="component/footer.jsp"></jsp:include>


            <!-- Load javascripts at bottom, this will reduce page load time -->
        <jsp:include page="component/js.jsp"></jsp:include>
        <!-- END BODY -->
    </body>
</html>