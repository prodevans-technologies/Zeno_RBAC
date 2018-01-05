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
                        <li><a href="${pageContext.request.contextPath }/control">SURF SAFE</a></li>
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
            <h1 style="color: white; " class="pdlADJ">View Bill</h1>
        </div>
        <div class="col-md-8 col-sm-12 pt-20 pt-20M" style="background-color: #ecf0f1;min-height: 116px;">
            <div class="col-md-8 col-sm-12">
                <h1 style="color: black;" class="currentBillFontforiPhone5">Hi ${user_details.getFirst_name() } </h1>
            </div>
            <div class=" col-md-4 col-sm-12 pdl">
            </div>
        </div>
        <div class="container" style="">
            <div style="margin-bottom: 4%;">
                <div class="col-sm-12 col-md-12" style="height:20%"></div>
                <div class="col-sm-12 col-md-12" style="height:30%">
                    <h3 style="color: black; text-align:center;" class="currentBillFontforiPhone5">
                        Oops! Your bill is not ready yet. Please check back later
                        <a href="${pageContext.request.contextPath }/dashboard"><br>Go Back to Home</a>
                    </h3>
                </div> 
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