<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ page session="false" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>ONE8</title>
        <link rel="shortcut icon" href="favicon.ico">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta content="ONE8 User Portal" name="description">
        <meta content="ONE8 User Portal Keywords" name="keywords">
        <meta content="vikram" name="author">

        <!-- link to image for socio -->

        <!-- Fonts START -->
        <link href="https://fonts.googleapis.com/css?family=Lato|Roboto:100" rel="stylesheet">
        <!-- Fonts END -->
        <!-- Global styles START -->          
        <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Global styles END --> 
        <!-- Theme styles START -->
        <link href="pages/css/components.css" rel="stylesheet">
        <link href="corporate/css/styleblue.css" rel="stylesheet">
        <link href="corporate/css/style-responsive.css" rel="stylesheet">
        <link href="corporate/css/themes/blue.css" rel="stylesheet" id="style-color">
        <link href="corporate/css/custom.css" rel="stylesheet">
        <!-- Theme styles END -->
        <style>
            .v_b {
                border-style: dashed;
                border-width: 1px;
                border-color: #D9D9D9;
            }
        </style>
    </head>

    <body class="corporate">
        <!-- BEGIN TOP BAR -->
        <div class="pre-header">
            <div class="container">
                <div class="row">
                    <!-- BEGIN TOP BAR MENU -->
                    <div class="col-md-12 col-sm-12 additional-nav" style=" font-size:12px; font-color:000000">
                        <ul class="list-unstyled list-inline pull-right ">
                            <li><i class=" fa fa-phone"></i><span>Lets Talk: +91 9019602602</span></li>
                        </ul>
                    </div>
                    <!-- END TOP BAR MENU -->
                </div>
            </div>
        </div>
        <!-- END TOP BAR -->
        <!-- BEGIN HEADER -->
        <div class="header">
            <div class="container">
                <a class="site-logo" href="#">
                    <img src="corporate/img/logos/logo.png" alt="ONE8"> </a>
                <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>
                <!-- BEGIN NAVIGATION -->
                <div class="header-navigation pull-right font-transform-inherit"  style="font-size:12px">
                    <ul>
                        <li class="dropdown active"> </li>
                        <li><a href="${pageContext.request.contextPath }/dashboard">Home</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath }/currentplan">Current plan</a></li>  
                        <li><a href="${pageContext.request.contextPath }/billingPayment">Make Payment</a></li>  
                        <li><a href="${pageContext.request.contextPath }/topup">Top up</a></li> 
                        <li><a href="#">Service Request</a></li> 
                        <li><a href="#">Help</a></li> 
                        <li><a href="#">Parental Control</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                                Settings      
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath }/profile">Profile</a></li>
                                <li><a href="#">Account</a></li>
                                <li><a href="#">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- END NAVIGATION -->
            </div>
        </div>
        <!-- Header END -->
        <div class="main">
            <div class="container">
                <!-- BEGIN CONTENT -->
                <div class="col-md-12 col-sm-12">
                    <div class="front-step front-step1"> </div>
                </div>
                <!-- END CONTENT -->
                <!-- BEGIN STEPS -->
                <div class="row margin-bottom-30 front-steps-wrapper">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 margin-top-10 ">
                        </div>
                        <div class="col-md-4 col-sm-4 v_b ">
                            <div class="content-form-page" >
                                <form class="form-horizontal form-without-legend" role="form">
                                    <div class="form-group"> <label for="email" class="col-lg-12 control-label"> <span class="require"></span></label>
                                        <div class="col-lg-12">
                                            <p style="font-size:15px; color:gray; line-height:2">Your Current Plan</p>
                                            <p style="font-size:10px; color:gray; line-height:1.5">Plan Name</p>
                                            <p style="font-size:10px; color:gray; line-height:1.5">Basic - &#8377; 849 Per Month </p>
                                            <div style=" padding-top:10%">
                                                <p style="font-size:15px; color:gray; line-height:2">Plan Content</p>
                                                <p style="font-size:10px; color:gray; line-height:1.5">1. 40GB Data <br/>2. 512Kbps Post FUP Speed</p>  
                                            </div> 
                                            <label for="email" class="col-lg-12 control-label"><a style="color:#F2F2F2F2; font-size:11px" href="#"><button type="submit" style=" color:#F2F2F2F2; font-size:14px; font-family:Roboto" class="btn btn-primary ">ok</button></a></label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4  ">
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12  ">
                    </div>
                </div>
                <!-- END STEPS -->
            </div>
        </div>
        <!-- END PRE-FOOTER -->
        <!-- BEGIN FOOTER -->
        <div class="footer" style="font-family:Roboto; position: fixed; right: 0; bottom: 0; left: 0;font-size:10px">
            <div class="container">
                <div class="row">
                    <!-- BEGIN COPYRIGHT -->
                    <div class="col-md-10 col-sm-10 padding-top-0 padding-bottom-10 "> 2017 &copy; ONE8. ALL Rights Reserved.&nbsp; 
                        <a href="javascript:;">Privacy Policy</a> |
                        <a href="javascript:;">Terms of Service</a> |
                        <a href="javascript:;">Refund and Cancellation</a> |
                        <a href="javascript:;">Feedback</a> |
                        <a href="javascript:;">Contact Us</a>
                    </div>
                    <!-- END COPYRIGHT -->
                </div>
            </div>
        </div>
        <!-- END FOOTER -->
        <!-- Load javascripts at bottom, this will reduce page load time -->
        <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
        <!--[if lt IE 9]>
          <script src="plugins/respond.min.js"></script>
          <![endif]-->
        <script src="plugins/jquery.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-migrate.min.js" type="text/javascript"></script>
        <script src="plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="corporate/scripts/back-to-top.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
        <script src="plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
        <!-- pop up -->
        <script src="plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script>
        <!-- slider for products -->
        <script src="corporate/scripts/layout.js" type="text/javascript"></script>

        <script type="text/javascript">
            jQuery(document).ready(function () {
                Layout.init();
                Layout.initOWL();
                Layout.initFixHeaderWithPreHeader(); /* Switch On Header Fixing (only if you have pre-header) */
                Layout.initNavScrolling();
            });
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->
        <!-- END BODY -->
    </body>
</html>