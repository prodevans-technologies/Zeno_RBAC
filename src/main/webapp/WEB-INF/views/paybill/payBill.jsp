<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ page session="false" %>

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
        <jsp:include page="../component/css.jsp"></jsp:include>

        </head>

        <body class="corporate" style="font-family: Roboto;">

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
                            <li ><a href="marcus.oneeight.co.in">Home</a></li>


                        </ul>
                    </div>
                    <!-- END NAVIGATION -->
                </div>
            </div>



            <div class="col-md-12 firstRow pt-20" style="background-image: url('corporate/img/back.png');">
                <h1 style="margin-left:5%;">Pay bill</h1>
            </div>    

            <div class="container">


            <form:form role="form" action="payBillRequest" method="post" modelAttribute="payBillDetails" >

                <div class="col-md-12" style="margin-top:5%;margin-bottom: 5%;">

                    <div class="col-md-2 col-sm-2">
                    </div>
                    <div class="col-md-8 col-sm-8">

                        <div class="row pb-40">
                            <div class="col-md-10 col-sm-10">
                                <form:input path="account_id" type="text" id="account_id" placeholder="One8 ID " required="true"/>            
                            </div>
                        </div>
                        <div class="row pb-40">
                            <div class="col-md-10 col-sm-10">
                                <form:input path="email_id" type="text" id="email_id" placeholder="Email ID " required="true"/>            
                            </div>
                        </div>
                        <div class="row pb-30">
                            <div class="col-md-10 col-sm-10">
                                <form:input path="amount" type="text" id="amount" placeholder="Amount "  required="true"/>            
                            </div>
                        </div>
                        <div class="row col-md-3"  margin-bottom: 5%;">
                             <button class="btn billButton" type="submit" style="padding: 5px;">
                                PAY BILL
                            </button>
                        </div>

                    </div>
                </div>

            </form:form>



        </div>    




        <jsp:include page="../component/footer.jsp"></jsp:include>   


            <!-- Load javascripts at bottom, this will reduce page load time -->
        <jsp:include page="../component/js.jsp"></jsp:include>
        <!-- END BODY -->
    </body>
</html>