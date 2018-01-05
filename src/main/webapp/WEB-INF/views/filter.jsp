<!-- 
    Document   : filter
    Created on : Oct 4, 2017, 12:34:28 PM
    Author     : rajanikant,abhinish
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@ page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
       

        
        
       
    
       <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jquery.min.js" charset="UTF-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/respond.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!--         ClockPicker Stylesheet 
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/clockpicker.css">
         ClockPicker script 
  <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/clockpicker.js"></script>
                            -->




        <title>MY ONE8</title>

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta content="ONE8 User Portal" name="description">
        <meta content="ONE8 User Portal Keywords" name="keywords">


        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">

        <!--  include the all css components -->
        <jsp:include page="component/css.jsp"></jsp:include>
        
        <jsp:include page="component/parental_check_js.jsp"></jsp:include>
        
        
            <style>
                input[type="url"]#url_pattern {
                    width: 100% !important;
                    padding: 10px;
                    height: 45px;
                    border: 1px solid #bdc3c7;
                    padding-bottom: 8px ! important;
                    padding-top: 8px ! important;
                    
                }
                
                .time_image {
                    padding: 6px 20px 8px 20px;
                    background-image: url('/zeno/img/icons/Time_blue.png') !important;
                    background-size: 62% !important;
                    background-repeat: no-repeat !important;
                    margin: 0px -9px 0px 7px ;
                    
                }
                .date_image {
                    padding: 6px 20px 8px 20px;
                    background-image: url('/zeno/img/icons/Calendar_blue.png') !important;
                    background-size: 62% !important;
                    background-repeat: no-repeat !important;
                    margin: 0px -9px 0px 7px ;
                }
                .input-group-addon {
                    
                    font-size: 14px;
                    font-weight: 400;
                    line-height: 1;
                    color: #555;
                    text-align: center;
                    border:unset;
                    background-color: unset !important;
                    border-radius: unset !important;                
                    padding: 9px 0px 6px 0px;
                    border-right-width: 0px;
                    margin-left: 0px;
                }



                select {
                    background-image: url(img/varrow2.png);
                    background-size: 29px 29px;
                    background-repeat: no-repeat;
                    background-position: right top;
                    width: 195px;
                    height: 34px;
                    border: none;
                    -moz-appearance: none;
                    -webkit-appearance: none;
                    border-bottom: 2px solid red;

                    /*    border: none;
                                                font-size: 16px;
                                                width:195px;
                                                padding-bottom:5px;
                                                outline: none;
                                                border-bottom: 2px solid #F44336;
                                                -webkit-appearance:none;
                                                -moz-appearance: none;
                                                    background-image:url(img/drop.jpg);    
                    */
                }

                option:hover {
                    background-color: grey;
                }

                /*                .nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus
                                {
                                    background: #2980b9;
                                    color: #fff;
                                    padding: 5px 15px 4px;
                                }*/

                table,th, td {
                    /*  border: 2px solid  black; */
                    align-content: center;

                }
                /** Tab content */
                .tab-content {
                    background: #FAFAFA;
                    padding:unset;
                }
                /*                .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus,
                                .nav-tabs > li > a:hover,.nav-tabs > li > a:focus{
                                    background: #f9faff00;
                                    color: #716868;
                                    padding: 5px 15px 4px;
                                    border-bottom: 7px red solid !important;
                
                                }*/
                /*icons and background sizes*/
                .nav-tabs > li.active > a#advance-filter {
                    color: #716868;
                    padding: 5px 15px 15px 60px;
                    border-bottom: 7px red solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Check_red.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }

            .nav-tabs > li > a#advance-filter {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px #fff solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/Check_grey.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }
            .nav-tabs > li.active > a#block-filter {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px red solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/Blocked_red.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }

            .nav-tabs > li > a#block-filter {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px #fff solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/Blocked_grey.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }

            .nav-tabs > li.active > a#custom-filter {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px red solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/Custom_red.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }

            .nav-tabs > li > a#custom-filter {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px #fff solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/Custom_grey.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }
            .nav-tabs > li > a#status-tab    {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px #fff solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/status-ico.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }
            .nav-tabs > li.active > a#status-tab {
                color: #716868;
                padding: 5px 15px 15px 60px;
                border-bottom: 7px red solid !important;
                background-image: url('${pageContext.request.contextPath }/img/icons/status-ico.png') !important;
                background-size: 43px !important;
                background-repeat: no-repeat !important;
                font-size: 20px;
            }
            .nav-tabs > li > a{

                margin-top: 10px;
                background: #FFF !important ;
                color: #716868;
                padding: 5px 15px 4px;

            }
            .nav-tabs {
                margin-top: 40px;
            }
            .nav>li {
                position: relative;
                display: block;
                margin-right: 70px;
                min-width: 18%;
            }
            .border{
                /*border-bottom: 1px solid #ddd;*/
                padding: unset ! important;
                font-size: 17px ! important;
            }
            input[type="checkbox"] + label {
                display: block;
                position: relative;
                padding-left: 35px;
                margin-bottom: 1px;
                font: 12px/14px;
                color: #010745;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                padding-bottom: 20px;
                text-align: left;
                padding-top: unset;
            }
            input[type="checkbox"] + label::before {
                content: '';
                display: block;
                width: 25px;
                height: 25px;
                border: 1.2px solid #010745;
                position: absolute;
                left: 0;
                top: 0;
                opacity: .6;
                -webkit-transition: all .12s, border-color .08s;
                transition: all .12s, border-color .08s;
            }
            #day_selector   input[type="checkbox"] + label {
                display: block;
                position: relative;
                padding-left: 35px;
                margin-bottom: 1px;

                color: #010745;
                cursor: pointer;

                -moz-user-select: none;

                width: 100px;
                padding-top: unset !important;
                float: left;
            }
            .ScrollStyle {

                overflow-y: scroll;
                max-height: 350px;
            }
            .category_box {

                min-height: 100px;
                padding: 40px;
                border: 1px solid #bdc3c7;
                margin-top: -1px;
                min-height: 350px;

            }
            .custom_box {

                min-height: 100px;
                padding-top: 2.7%;
                border: 2px solid #2980b9;
                margin-top: -1px;
                margin-bottom: 20px;
                /*                    padding-top: 10px;*/
            }
/*            .btn {
                margin-top: 20px !important;
                margin-bottom: 1px;
                font-size: 22px;
                padding-left: 20px;
                padding-right: 20px;
                padding-top: unset;
                padding-bottom: unset;

            }*/
            #custom_urlblocker_form >.row{
                margin-right: unset;
                margin-left: unset;
            }
            .panel {
                border: 2px solid #F44336;
                border-radius: unset;
                margin-bottom: unset;
            }
            .panel-default > .panel-body{
                height: 200px;
                overflow-x: auto;
            }
            .panel-default > .panel-heading {
                color: white;
                background-color: #F44336;
                border-color: #F44336;
                border-radius: unset;
                font-size: 24px;
            }
            .panel-footer{
                /*border: 2px solid #2980b9;*/
                background: unset;
                padding-right: unset;
            }
            .panel-default > .panel-footer{
                /*background-color: #F44336;*/
                border-top:2px #F44336 solid;
                border-radius: unset;
                padding-right: unset;
            }
            .tab-content , .tab-pane{
                background: unset;
            }
            .nav-tabs.nav-justified > li > a {
                border-radius: unset;
            }

            .largeFont
            {
                font-size: 38px !important;
            }

            .scroll {
                /*                    //width: 200px;*/
                height: 268px;
                background: red;
                overflow: scroll;
            }
            .scroll::-webkit-scrollbar {
                width: 12px;
            }

            .scroll::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
                border-radius: 10px;
            }

            .scroll::-webkit-scrollbar-thumb {
                border-radius: 10px;
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
            }
            #applySchedule > .modal-dialog > .modal-content > .modal-header{
                color:white;
                background-color: red;
                padding-top: 1%;
                padding-bottom: 1%;
                border:2px #010745 solid;
                border-color: black;
                
            }
           #applySchedule > .modal-dialog > .modal-content {
           min-width: 60%;
           
           min-height: 50%;
           max-height: 60%
           }
           #applySchedule > .modal-dialog {
            min-width: 60%;
           max-width: 70%;
           min-height: 40%;
           max-height: 60%;
           }
            .col-md-6 >.label {
            color: black;  
            text-align: right;
            margin:  3% 0% 3% 0%;
            font-size: 14px;
           }
           .col-md-12, .col-sm-12 > .col-md-6
           {
           padding: 1%
           }
           .status-tab_box{
            max-height: 150px;
            overflow-x: auto;       
           }
           .scroll::-webkit-scrollbar-thumb {
               border-radius: 10px;
               -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
           }
           #myAlert{
               color: #db3236;
               position: fixed;
               bottom: 30px;
               left: 30px;
               background-color: #fff;
               border: 1px #db3236 solid;
           }
           .col-md-2
           {
               /*width: 12.666667% !important;*/
               padding-right: unset !important;
               padding-left: unset !important;
           }
           .col-md-4 {
               padding-left: unset;
               padding-right: unset;
               width: 33.33333333% !important;
           }

           .ss-status-led{
               height: 10px;
               width: 10px; 
               float:start ;width:10px;height:10px;
           }
           #day_selector
           {
               margin-left: 2.33% ! important;
               margin-right:2.33% ! important;
           }
           
/*           Footer alingment need to be adjusted for SurfSafe*/
           
           .footer > .row 
           {
               margin-left: -1% ! important; 
               margin-right: -1% ! important;
           }

           
/*          Media Queries for the folloing devices*/


            /*        Tablet*/
            @media (max-width: 730px) and (min-width:501px)
            {
                .col-md-7, col-xs-7,.col-md-5, col-xs-5 
                {
                    padding-right: unset;
                }
                .category_box
                {
                    padding: 15px !important;
                }
                .border
                {
                    padding: 0px !important;
                }
                .Surf_Safe
                {
                    font-size: 27px ! important; 
                }
            }
/*            Mobile*/
            @media (max-width: 500px) and (min-width: 240px)
            {
               .Surf_Safe
                {
                    font-size: 150%;
                }
                .user_name{
                    margin-left: 52%;
                     font-size: 130% !important;
                }
                .mobile_tab
                {
                    font-size: 15px;
                    padding-left: 33px;
                    border-bottom: 5px;
                    min-width: 115px;
                       
                }
                .category_list{
                height: 400px; ; 
                overflow-x: auto;
                }
                .category_box{
                    padding: 6.5%;
                    min-height: 415.2px;
                    
                }
                .botton_aling{
                margin-right: 13px;
                }
                

                .nav > li {
                    position: relative; 
                    display: block; 
                    margin-right: unset !important;
                    min-width: 50% !important;
                   
                }
                .nav-tabs > li.active > a#advance-filter {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px red solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Check_red.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                    font-size: 100% !important;    
                    width: 90%;
                }

                .nav-tabs > li > a#advance-filter {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px #fff solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Check_grey.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                    font-size: 100% !important;    
                    width: 90%;
                }
                .nav-tabs > li.active > a#block-filter {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px red solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Blocked_red.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                    font-size: 100% !important;    
                    width: 90%;
                }

                .nav-tabs > li > a#block-filter {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px #fff solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Blocked_grey.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                   font-size: 100% !important;    
                    width: 90%;
                }

                .nav-tabs > li.active > a#custom-filter {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px red solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Custom_red.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                   font-size: 100% !important;    
                    width: 90%;
                }


                .nav-tabs > li > a#custom-filter {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px #fff solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/Custom_grey.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                    font-size: 100% !important;    
                    width: 90%;
                }
                .nav-tabs > li.active > a#status-tab {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px red solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/status-ico.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                    font-size: 100% !important;    
                    width: 90%;
                }


                .nav-tabs > li > a#status-tab {
                    color: #716868;
                    padding: 2% 6% 11% 24%;
                    border-bottom: 5px #fff solid !important;
                    background-image: url('${pageContext.request.contextPath }/img/icons/status-ico.png') !important;
                    background-size: 18% !important;
                    background-repeat: no-repeat !important;
                    font-size: 100% !important;    
                    width: 90%;
                }
                .row > .font-h3 {
                    font-size: 130%;
                    
                }
                .tab-content {
                    
                    padding-left: 4% !important;
                    padding-right: 4% !important;
                }
                
/*               to aling Block specific websites. */
                .row > .col-md-4
                {
                    width:100% !important;
                }
                #blockedALLUnblock
                {
                    margin-right: 4%;
                }
                #apply_schedule
                {
                    float: inline-end;
                }
                .panel-footer > .text-right    
                {
                    width:100% ! important;
                }
                #day_selector   input[type="checkbox"] + label
                {
                    width: 50% ! important;
                }
/*                input[type="checkbox"] + label::before 
                {
                    content: '';
                    display: block;
                    width: 25px;
                    height: 25px;
                    border: 1.2px solid #010745;
                    position: absolute;
                    left: 0;
                    top: 0;
                    opacity: .6;
                    -webkit-transition: all .12s, border-color .08s;
                    transition: all .12s, border-color .08s;
                }*/
                                                                

            }
            
/*            Laptop size*/
            @media ( max-width :1921px) and (min-width:1340px) 
            {
                .Surf_Safe
                {
                    font-size: 36px;
                }
                .modal-body > .row > .col-md-12
                {
                    margin-left: -1%;
                }
                #blockedALLUnblock
                {
                    margin-right: 4%;
                }
                
            }



            .scroll::-webkit-scrollbar-thumb {
                border-radius: 10px;
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
            }
            #myAlert{
                color: #db3236;
                position: fixed;
                bottom: 30px;
                left: 30px;
                background-color: #fff;
                border: 1px #db3236 solid;
            }
            @media (max-width: 730px) 
            {
                .col-md-7, col-xs-7,.col-md-5, col-xs-5 
                {
                    padding-right: unset;
                }
            }


            .col-md-2
            {
                /*width: 12.666667% !important;*/
                padding-right: unset !important;
                padding-left: unset !important;
            }
            .col-md-4
            {
                /*width: 37.333333% !important;*/
            }
            @media ( max-width :1366px ) and (min-width:1024px)
            {
                .Surf_Safe
                {
                    font-size: 36px ! important;
                }
                
            }



            
            
           

            

        </style>



    </head>
    <!-- BEGIN HEADER -->
    <div class="header">
        <div class="row">
            <a class="site-logo" href="${pageContext.request.contextPath }/dashboard"> <img
                    src="${pageContext.request.contextPath }/corporate/img/logos/logo.png" alt="ONE8">
            </a> <a href="javascript:void(0);" class="mobi-toggler"><i
                    class="fa fa-bars"></i></a>
            <!-- BEGIN NAVIGATION -->
            <div class="header-navigation pull-right font-transform-inherit"
                 style="font-size: 12px">
                <ul> 

                    <li class="dropdown active"></li>
                    <li><a href="${pageContext.request.contextPath }/dashboard">MY ONE8</a></li>
                    <li><a
                            href="${pageContext.request.contextPath }/billingPayment">PAY YOUR BILL</a></li>
                    <li class="active"><a
                            href="${pageContext.request.contextPath }/control">SURF SAFE <!--  <img class="ss-status-led" id="parental-led"  title="SURF SAFE Status" >--></a></li>
                    <li><a href="${pageContext.request.contextPath }/service">SERVICE</a></li>

                    <li><a href="${pageContext.request.contextPath }/profile">PROFILE</a></li>
                    <li><a href="${pageContext.request.contextPath }/logout">LOGOUT</a></li>
                </ul>
            </div>
            <!-- END NAVIGATION -->
        </div>
    </div>

    <div class="row firstRow pt-20"
         style="background-image: url('${pageContext.request.contextPath }/img/red_long.png');" style="clear: both">
        <!--  <h1 class="paddingLeftTop" >Parental Control</h1> <h1 class="paddingRight" >Hi Vamsi </h1>  -->
        <div class="col-md-5 col-sm-5" style="padding-left: 4.9%;">
            <h1>Surf Safe</h1>
        </div>
         <div class="row firstRow pt-20" style="padding-right: 5%;margin-bottom: -20px;margin-top: -10px;text-align:right;">
         <b style="float: right">${user.getActname()}<br/>${user.getActid()}</b><br/>
         <!--    <h4 style="float: middle">A/C Name : ${uesr_name}</h4>
            <h4 style="float: middle">A/C ID : ${actid}</h4> -->
        </div>

    </div>


    <div class="container" > 
        <h1 class=" pb-10" style=" font-size: 28px;">With Surf Safe, you are in control</h1>

        <h4>
            Your home is your safe space and you deserve to keep it that way. With our Advanced Surf Safe controls you can decide what content categories to keep out of your network. If there are specific websites you want to block, go ahead and add to your Custom setting. Surf Safe, and ensure every-one on your network does too!
        </h4>


        <ul class="nav nav-tabs  margin-top-20">
            <c:choose>
                <c:when test="${not empty advanced_error }">
                    <li class=" active"><a id="advance-filter" data-toggle="tab" href="#Allowed">ADVANCED</a></li>
                    <li class=" "><a id="block-filter" data-toggle="tab" href="#Blocked"  >BLOCKED</a></li>
                    <li class=" "><a id="custom-filter" data-toggle="tab" href="#Custom" >CUSTOM</a></li>
                    <li class=" "><a id="status-tab" data-toggle="tab" href="#status" >STATUS</a></li>
                    
                    <c:set var="default" value="active"></c:set>
                    </c:when>
                    <c:when test="${not empty blocked_error }">
                    <li class=" "><a id="advance-filter" data-toggle="tab" href="#Allowed">ADVANCED</a></li>
                    <li class=" active"><a id="block-filter" data-toggle="tab" href="#Blocked"  >BLOCKED</a></li>
                    <li class=" "><a id="custom-filter" data-toggle="tab" href="#Custom" >CUSTOM</a></li>
                    <li class=" "><a id="status-tab" data-toggle="tab" href="#status" >STATUS</a></li>
                       
                    </c:when>
                    <c:when test="${not empty update_url_error ||  not empty custom_error }">
                    <li class=" "><a id="advance-filter" data-toggle="tab" href="#Allowed">ADVANCED</a></li>
                    <li class=" "><a id="block-filter" data-toggle="tab" href="#Blocked"  >BLOCKED</a></li>
                    <li class="active "><a id="custom-filter" data-toggle="tab" href="#Custom" >CUSTOM</a></li>
                    <li class=" "><a id="status-tab" data-toggle="tab" href="#status" >STATUS</a></li>   
                    </c:when>
                    <c:when test="${not empty update_url_error ||  not empty custom_error }">
                    <li class=" "><a id="advance-filter" data-toggle="tab" href="#Allowed">ADVANCED</a></li>
                    <li class=" "><a id="block-filter" data-toggle="tab" href="#Blocked"  >BLOCKED</a></li>
                    <li class=""><a id="custom-filter" data-toggle="tab" href="#Custom" >CUSTOM</a></li>
                    <li class="active"><a id="status-tab" data-toggle="tab" href="#status" >STATUS</a></li>   
                    </c:when>
                    
                    
                    <c:otherwise>
                    <li class="active"><a id="advance-filter" data-toggle="tab" href="#Allowed">ADVANCED</a></li>
                    <li class=" "><a id="block-filter" data-toggle="tab" href="#Blocked"  >BLOCKED</a></li>
                    <li class=" "><a id="custom-filter" data-toggle="tab" href="#Custom" >CUSTOM</a></li>
                    <li class="  "><a id="status-tab" data-toggle="tab" href="#status" >STATUS</a></li>
                        <c:set var="default"  value="active"></c:set>
                    </c:otherwise>
                </c:choose>



        </ul>


        <div class="tab-content">
            <div id="Allowed" class="tab-pane fade  <c:if test="${ empty blocked_error && empty update_url_error && empty custom_error  }"> in active </c:if> row ">
                <form:form action="allow-categories" modelAttribute="CategoryListDetails" method="post" >
                    <div class="category_box">

                        <div  style="height:250px ; overflow-x: auto;">   
                            <p class="font-h4" style="padding-bottom: 15px;">Choose content categories that you don’t want to view on your network and hit BLOCK to keep related websites out.</p>
                            <c:forEach items="${CAT.getAllowded_catogery()}" var="cat" >
                                <div class="col-md-6 col-sm-6 border text-justify">
                                    <input type="checkbox" name="category_allowed" id="${cat}"  value="${cat}"><label for="${cat}"> <c:out value="${cat}"/> </label>	
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                    <form:hidden path="allowded_catogery" />
                    <form:hidden path="blocked_catogery" />

                    <div class="panel-footer">

                        <div class="col-md-6"></div>
                        <div class="col-md-4 text-right">
                            <c:if test="${not empty advanced_error }">
                                <h4 style="color:red;margin-top: 5%;">
                                    <c:if test="${fn:contains(advanced_error, 'Oops!')}">
                                    <span class="glyphicon glyphicon-alert"></span>
                                    </c:if>
                                    <c:out value="${advanced_error }"></c:out>
                                    </h4>
                            </c:if>
                        </div>
                        <div class="col-md-2 text-right">
                            <button id="advacneBlock" class="btn billButton font-h3" type="submit">BLOCK</button>
                        </div>
                    </div>
                </form:form> 	
            </div>
            <div id="Blocked" class="tab-pane fade row <c:if test="${not empty blocked_error }"> in active</c:if>">
                <form:form action="block-categories" modelAttribute="CategoryListDetails" method="post" >
                    <div class="category_box">
                        <div style="height:250px ; overflow-x: auto;"> 
                            <p class="font-h4" style="padding-bottom: 15px;">View and edit your list of blocked categories. To allow a category from this list, check the box next to it and hit UNBLOCK </p>
                            <c:forEach items="${CAT.getBlocked_catogery()}" var="cat">
                                <div class="col-md-6 col-sm-6 border text-justify">
                                    <input type="checkbox" name="category_block" id="${cat}"  value="${cat}"><label for="${cat}"> <c:out value="${cat}"/> </label>	
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                    <form:hidden path="allowded_catogery" />
                    <form:hidden path="blocked_catogery" />
                    <div class="row text-right">
                        <!--<div class="col-md-3"></div>-->
                        <div class="col-md-8 text-right">
                            <c:if test="${not empty blocked_error }">
                                <p style="color:red;margin-top: 4%; " >
                                    <c:if test="${fn:contains(blocked_error, 'Oops!')}">
                                        <span class="glyphicon glyphicon-alert"></span>
                                    </c:if>
                                    <c:out value="${blocked_error }"></c:out>
                                </p>
                            </c:if>
                        </div>
                        <div class="col-md-4" >
                        <button id="blockedUnblock" class="btn billButton" type="submit" formaction="block-categories" >UNBLOCK</button>
                        <button id="blockedALLUnblock" class="btn billButton" type="submit" formaction="block-all-categories">UNBLOCK ALL</button>
                        </div>
                    </div>
                 </form:form>
            </div>
            <div id="Custom" class="tab-pane fade row <c:if test="${not empty update_url_error || not empty custom_error }"> in active</c:if>">
                    <div class="category_box ">


                        <div class="row">
                        <form:form  action="update-patterns" modelAttribute="CategoryListDetails" method="post" >
                            <div class=" row" >
                                <label for="url-block" class="col-md-4 col-sm-12 text-justify font-h3" title="Add the URL to be blocked" >Block specific websites.</label>
                                <div class="col-md-8" style="padding: unset;">
                                    <input id="url_pattern" type="url" class="" style="width:100%; margin-top: 6px; font-size: 24px;" name="url_pattern" placeholder="www.example.com" pattern="[h]{0,1}[ftw][tw][pw][s]{0,1}[.:/]{1,3}[\w\W]*" required="required" >
                                </div>
                            </div>
                            <form:hidden path="filter_pattern" />
                            <form:hidden path="remove_filter_pattern" />
                            <div class="row " >

                                <div class="col-md-6"></div>
                                <div class="col-md-4 text-right">
                                    <c:if test="${not empty update_url_error }">
                                        <h4 style="color:red;margin-top: 5%;">
                                            <c:if test="${fn:contains(update_url_error, 'Oops!')}">
                                    <span class="glyphicon glyphicon-alert"></span>
                                    </c:if>
                                            <c:out value="${update_url_error }"></c:out>
                                            <c:set var="uodateURLError" value="" />
                                        </h4>
                                    </c:if>
                                </div>
                                <div class="col-md-2 text-right">
                                    <button id="customBlock" type="submit" class="btn billButton ">BLOCK</button>
                                </div>
                            </div>
                        </form:form>

                    </div>
                        
                    <div style="height:200px ; overflow-x: auto;">  
                        <form:form action="delete-patterns" modelAttribute="CategoryListDetails" method="post"  id="custom_urlblocker_form">

                            <div class="row">
                                <p class="font-h4 " style="padding-bottom: 15px">Key in specific URLs you want to block to curate your network.  </p>
                                <c:forEach items="${CAT.getFilter_pattern()}" var="cat">
                                    <div class="col-md-6 col-sm-6 border text-justify">

                                        <input type="checkbox" name="filter_category" id="${cat}"  value="${cat}"><label for="${cat}"><c:out value="${fn:substring(cat, 2, fn:length(cat)-2)}"/> </label>	

                                    </div>
                                </c:forEach> 
                                <form:hidden path="filter_pattern" />
                                <form:hidden path="remove_filter_pattern" />
                            </div>
                        </div>
                    </div>
                    
                            <div class="row text-right">
                        <!--<div class="col-md-3"></div>-->
                        <div class="col-md-8 text-right">
                            <c:if test="${not empty custom_error }">
                                <p style="color:red;margin-top: 4%; " >
                                    <c:if test="${fn:contains(custom_error, 'Oops!')}">
                                        <span class="glyphicon glyphicon-alert"></span>
                                    </c:if>
                                    <c:out value="${custom_error }"></c:out>
                                </p>
                            </c:if>
                        </div>
                        <div class="col-md-4" >
                        <button id="blockedUnblock" class="btn billButton" type="submit" formaction="delete-patterns" >UNBLOCK</button>
                        <button id="blockedALLUnblock" class="btn billButton" type="submit" formaction="delete-all-patterns">UNBLOCK ALL</button>
                        </div>
                    </div>
                </form:form>

                    
            </div>
                    
                     <div id=status class="tab-pane fade row <c:if test="${not empty blocked_error }"> in active</c:if>">
                <form:form action="Status" >
                 
                    <div class="category_box">  
                        <form:form action="delete-patterns" modelAttribute="CategoryListDetails" method="post" >

                            <div class="row">
                                <!--  <p class="font-h4 " style="padding-bottom: 15px">Hi ${uesr_name} you have applied the </p><br>-->
                                <div >
                                <p> Recuring: </p>
                                <div class="col-md-12 status-tab_box" >
                                    <table class="table table-border">
                                        <tr>
                                            <th>Start Time</th> 
                                            <th>End Time</th>
                                            <th>Days</th>
                                            <th>Delete</th>
                                        </tr>
                                       <!--  <tr>                                        
							                    <c:forEach items="${scheduleStatusDetails}" var="scheduleStatusDetails">                       
							            		<tr>
                									<td>${StatusDetails.start_time}</td>
               										 <td>${StatusDetails.getEnd_time()}</td>
           										 </tr>
        										</c:forEach>  
							                    
            									<td><span class="glyphicon glyphicon-remove" style="color:red"></span></td>
										</tr>
                                            -->
                                          <tr>                                        
                                            <td>${StatusDetails.start_time}</td> 
                                            <td>${StatusDetails.end_time}</td>
                                            <td>${StatusDetails.when}</td>


                                            <td><span class="glyphicon glyphicon-remove" style="color:red"></span></td>
                                        </tr>
                                       
                                    </table>

                                </div>
                               </div>
                                <div >
                                    <p style="margin-top: 18%"> Non Recuring: </p>
                                <div class="col-md-12 status-tab_box">
                                    <table class="table table-border">
                                        
                                        <tr>
                                            <th>Start Date</th> 
                                            <th>Start Time</th> 
                                            <th>End Date</th>
                                            <th>End Time</th>
                                            <th>Delete</th>
                                        </tr>
                                        <tr>                                       
                                           
                                            
                                            <td>${StatusDetails.start_date}</td> 
                                            <td>${StatusDetails.start_time}</td> 
                                            <td>${StatusDetails.end_date}</td>
                                            <td>${StatusDetails.end_time}</td>                                     
                          
                                            <td><span class="glyphicon glyphicon-remove" style="color:red"></span></td>
                                        </tr>
                                                                             
                                    </table>

                                </div>
                                </div>
                            </div>
                        </form:form>
                    </div>

                 </form:form>
                <div class ="col-md-10"></div>
                <div class="col-md-2" >
                    <a id="apply_schedule" class="btn billButton" type="submit" data-toggle="modal" href="#applySchedule" style="float:right">APPLY SCHEDULE</a>
                    
                </div>
                
                <!-- The Add_Schedule Pop_Up  -->
                <div id="applySchedule" class="modal fade" style="margin-top:5%;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:#FFF">
                                    <img alt="" src="img/close.png" style="height: 25px;width: 25px;">
                                </button>
                                <h4 class="modal-title" style="padding-left: 5%;text-align: center;">ADD SCHEDULE</h4>
                            </div>

                            <div class="modal-body" >
                                <div class="row">
                                    <div class="col-md-12" ><jsp:include page="parental-control.jsp"/></div>
                                   <jsp:include page="component/timedatepicker.jsp"></jsp:include>
                                   <jsp:include page="component/analogueclockpicker.jsp"></jsp:include>
<!--                                    <div class="col-md-12 col-sm-12">
                                        <div class="col-md-6">
                                        <div class="col-md-4 label">Select type</div>
                                        <div class="col-md-8">
                                           
                                            <select name="select_type" id=Scheduling_type>
                                                <option value="Daily">Daily</option>
                                                <option value="Weekdays">Weekdays</option>
                                                <option value="Weekends">Weekends</option>
                                                <option value="Custom"> Custom</option>
                                                <option value="Non Recurring">Non Recurring</option>
                                            </select> 
                                        </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12" style="margin-left: -6px;" id="sc_date_div">
                                        <div class="col-md-6">
                                            <div class="col-md-4 label" id="start_date_l">Start Date</div>                                        
                                            <div 
                                                class="col-md-8 input-group datepicker" id="start_date" data-placement="right" data-align="top" data-autoclose="true">
                                                <input type="text" name="Start Date ">
                                                <span class="input-group-addon" style="border-bottom: 1px solid #bdc3c7;">
                                                    <span class="date_image form_date" data-date-format="dd MM yyyy" data-link-field="date-start" data-link-format="yyyy/mm/dd">                                                     
                                                    </span>                                                     
                                                </span>
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                             <div class="col-md-2 label" id="end_date_l">End Date
                                             </div>                                       
                                             <div class="col-md-8 input-group datepicker" id="end_date" data-placement="right" data-align="top" data-autoclose="true">
                                                 <input type="text" name="End Date">
                                                 <span class="input-group-addon" style="border-bottom: 1px solid #bdc3c7;">
                                                     <span class="date_image form_date" data-date-format="dd MM yyyy" data-link-field="date-start" data-link-format="yyyy/mm/dd">

                                                     </span>

                                                 </span>
                                             </div>
                                         </div>
                                    </div>
                                         <div class="col-md-12 col-sm-12"style="margin-left: -5px;" id="sc_time_div">
                                             <div class="col-md-6">
                                                 <div class="col-md-4 label">Start Time</div>
                                                 <div class="input-group col-md-8 clockpicker">
                                                     <input type="text" name="Start Time " id="start_time" class="form-control" value="09:30"> 
                                                     <span class="input-group-addon" style="border-bottom: 1px solid #bdc3c7;">
                                                         <span class="time_image form_time" data-date-format="hh:ii" data-link-field="time-ip-end"  data-link-format="hh:ii">                                                     
                                                         </span>

                                                     </span>
                                                 </div>
                                             </div>
                                             <div class="col-md-6">
                                                 <div class="col-md-2 label" style="margin-right: 2%;">End Time</div>
                                                 <div class="input-group col-md-8 clockpicker">
                                                     <input type="text" name="End Time">
                                                     <span class="input-group-addon" style="border-bottom: 1px solid #bdc3c7;">
                                                         <span class="time_image form_time" data-date-format="hh:ii" data-link-field="time-ip-end"  data-link-format="hh:ii">

                                                         </span>

                                                     </span>
                                                 </div>
                                             </div>

                                         </div>
                                    <div class="col-md-12" id="sc_day_div">
                                        <div id="day_selector" class="col-md-12 col-md-offset-.5 margin-top-10" >

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="sun" value="sunday" readonly="true"><label for="sun">SUN</label>

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="mon" value="monday"><label for="mon">MON</label>

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="tue" value="tuesday"><label for="tue">TUE</label> 

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="wed" value="wednesday"><label for="wed">WED</label>

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="thu" value="thursday"><label for="thu">THU</label>

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="fri" value="friday"><label for="fri">FRI</label>

                                            <input type="checkbox" name="days_days_checkbox" class="col-md-2 chk" id="sat" value="saturday"><label for="sat">SAT</label>
                                        </div>
                                    </div>
                                </div> Col-md-12 -->
                            </div><!-- Modal Body -->
                    </div>
                </div>
                     </div>
                
            </div>
                

        </div>

       

        <!--  
        <c:if test="${not empty error }">
            <div id="myAlert" class="alert alert-danger">
                <a href="#" class="close">&times;</a>
            <c:out value="${error }"></c:out>
            </div>

                <!--<h3 style="color: green"></h3>-->
            <%--<c:set var="error" value="" />--%>
            <!-- 
        </c:if>
        <c:if test="${not empty msg }">
            <div id="myAlert" class="alert alert-danger">
                <a href="#" class="close">&times;</a>
            <c:out value="${msg }"></c:out>
            </div>
        </c:if>
        -->

    </div>



    <!-- included pop up -->
    <jsp:include page="component/pop-up.jsp"></jsp:include>

    <jsp:include page="component/footer.jsp"></jsp:include>

        <!-- Load javascripts at bottom, this will reduce page load time -->
    <jsp:include page="component/js.jsp"></jsp:include>
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jquery.min.js" charset="UTF-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var schedule_counter = 1;
            <c:if test="${not empty day_msg || not empty date_msg || not empty time_msg}">
                  if (schedule_counter == 1) {
                    $("#schedule_images").removeClass("plus_image");
                    $("#schedule_images").addClass("minus_image");
//                    $('html, body').stop().animate({
//                    scrollTop: $("#div1").offset().top
//                }, 2000);
                    location.href = "#schedule_images";
                    schedule_counter = 2;
                }  
    
            </c:if>
            
            $(".close").click(function () {
                $("#myAlert").slideUp();
            });
            $("#schedule_images").click(function () {
                if (schedule_counter == 0) {
                    $("#schedule_images").removeClass("plus_image");
                    $("#schedule_images").addClass("minus_image");
                    schedule_counter = 2;
                } else if (schedule_counter == 1) {
                    $("#schedule_images").removeClass("plus_image");
                    $("#schedule_images").addClass("minus_image");
                    $("#collapse1").toggle();
                    schedule_counter = 2;
                } else {
                    $("#schedule_images").removeClass("minus_image");
                    $("#schedule_images").addClass("plus_image");
                    $("#collapse1").toggle();
                    schedule_counter = 1;
                }
            });
        });
        
//    Start--    AutoComplete Function for URL box
   $(document).ready(function () {
    $("#url_pattern").change(function() {
   
        if (this.value.indexOf("www.")!==-1){
          if (this.value.indexOf("http://") ===-1) {
              if (this.value.indexOf("https://") ===-1 ){
                  if (this.value.indexOf("ftp://") ===-1 )
                  {
                   this.value = "http://" + this.value;
                  }
              }
          
          }}else  if (this.value.indexOf(".")>=2){		 
                    if (this.value.indexOf("http://") ===-1) {
                      if (this.value.indexOf("https://") ===-1 ){
                          if (this.value.indexOf("ftp://") ===-1 )
                            {
                             this.value = "http://" + this.value;
                            }}}}
    });
});

//Start--Pop up "Add Scheduling" 
$('#Scheduling_type').on('change', function() {

  switch ($(this).val()) {
    case 'Weekdays':
      $('#sc_date_div').slideUp("slow");
      $('#day_selector').slideDown("slow");
      $('#sc_time_div').slideDown("slow");
      $('.chk').prop('disabled', true);
      $('#mon').prop('checked', true);
      $('#tue').prop('checked', true);
      $('#wed').prop('checked', true);
      $('#thu').prop('checked', true);
      $('#fri').prop('checked', true);
      $('#sat').prop('checked', false);
      $('#sun').prop('checked', false);
      break;
    case 'Weekends':
      $('#sc_date_div').slideUp("slow");
      $('#day_selector').slideDown("slow");
      $('#sc_time_div').slideDown("slow");
      $('.chk').prop('disabled', true);
      $('#mon').prop('checked', false);
      $('#tue').prop('checked', false);
      $('#wed').prop('checked', false);
      $('#thu').prop('checked', false);
      $('#fri').prop('checked', false);
      $('#sat').prop('checked', true);
      $('#sun').prop('checked', true);
      break;
    case 'Daily':
      $('#sc_date_div').slideUp("slow");
      $('#day_selector').slideUp("slow");
      $('#sc_time_div').slideDown("slow");

    break;
    case 'Custom':
      $('#sc_date_div').slideUp("slow");
      $('#day_selector').slideDown("slow");
      $('#sc_time_div').slideDown("slow");
      $('.chk').prop('disabled', false);
      $('#mon').prop('checked', false);
      $('#tue').prop('checked', false);
      $('#wed').prop('checked', false);
      $('#thu').prop('checked', false);
      $('#fri').prop('checked', false);
      $('#sat').prop('checked', false);
      $('#sun').prop('checked', false);
        
    break;
    case 'Non Recurring':
      $('#sc_date_div').slideDown("slow");
      $('#day_selector').slideUp("slow");
      $('#sc_time_div').slideDown("slow");
    break;
    default:
      $('#mon').prop('checked', false);
      $('#tue').prop('checked', false);
      $('#wed').prop('checked', false);
      $('#thu').prop('checked', false);
      $('#fri').prop('checked', false);
      $('#sat').prop('checked', false);
      $('#sun').prop('checked', false);
    
  }

});

//End--Pop up "Add Scheduling" 


  </script>


</body>
</html>
