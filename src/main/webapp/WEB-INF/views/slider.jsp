<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>STOIC ZENO</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta content="Stoic Zeno User Portal" name="description">
	<meta content="Stoic Zeno User Portal Keywords" name="keywords">


	<style>
	
.row {
	margin: unset;
}

.form-info {
	border: unset;
	padding-left: 1px !important;
}

div.content-form-page 
{
    background: #fff;
    padding: 5px 20px 30px;
    margin-right: 20px !important;
}

.header .container {
	position: relative;
	width: 92%;
}

.form-without-legend {
	padding-top: 25px;
	font-family: Roboto;
}

.tag-line {
	font-family: Roboto;
	font-size: 70px;
}
.front-steps-wrapper h2, .ecommerce .front-steps-wrapper h2 tag-line{
	font-size: 70px !important;
}
.loginBoxSqr
{
	width: 85% !important;
}
    body {
        background: #eee;
        color:#000;
        margin: 0;
        padding: 0;
    }
    .swiper-container {
        width: 105%;
        height: 77%;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
    .logincontainer {
 position: absolute;
  height: calc(100vh);
  margin-top: 64px;
  display: flex;
  flex-direction: column;
  justify-content: left;
  align-items: left;
  z-index: 997;
  top: 0px;
   width: 100%;
}

@media ( max-width : 750px) 
{
	.swiper-container
	{
		height: 250%;
	}
} 
    </style>

  




	
	<link rel="stylesheet" href="slider-resource/swiper.min.css">
	
	



<jsp:include page="component/css.jsp"></jsp:include>


	</head>
	<body class="corporate">
	
	
	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">
			<a class="site-logo" href="#"> <img
				src="corporate/img/logos/logo.png" alt="Stoic Zeno">
			</a> <a href="javascript:void(0);" class="mobi-toggler"><i
				class="fa fa-bars"></i></a>
			<!-- BEGIN NAVIGATION -->
			
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->
	<div id="is-desktop" class="show">

	 <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_1.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_2.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_3.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_4.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_5.jpg)"></div>
     	</div>
     	
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
      <div class="" style="position: absolute;height: calc(100vh);margin-top: 64px;display: flex;flex-direction: column;justify-content: left;align-items: left;z-index: 997;top: 0px;width: 100%;">    		
				<div class="row">	
				<div class="col-md-12 margin-bottom-10 front-steps-wrapper">
						
					<div class="col-lg-8 col-md-8 col-sm-8">
							<div style="margin-top: 8%; padding-left: 6%;">
								<h2 class="tag-line">
									Welcome to the<br> network that never stops
								</h2>
							</div>
					</div>	 
						
					   
					   <div class="col-md-4 col-sm-4  pb-30">
					    
							<div class="loginBoxSqr">
								<h3 style="font-size: 24px">Login</h3>
								<div class="content-form-page">


									<form class="form-horizontal form-without-legend"
										role="form" action="login" method="post" >
										<div class="form-group">

											<div class="col-lg-12 pb-20">
												<input  type="text" id="mystoicid"
													style="font-size:24px;" placeholder="My One8 ID " />
											</div>
										</div>
										<div class="form-group">

											<div class="col-lg-12 pb-10">
												<input path="password" type="password" id="password"
													style="font-size:24px;" placeholder="My One8 Password " />
											</div>
											<div class="col-md-12">
												<a style="color: #989494;" href="#">I forgot my One8
													Password</a>
											</div>
											<div class="col-md-12">
												<input id="remember" type="checkbox" name="remember"
													value="remember"> &nbsp; <label for="remember"
													class="font-h4"> Remember me </label>
											</div>
										</div>
										<div class="row" style="text-align: right;">
											<!-- added ID for button for testing -->
											<button type="submit" id="submitButton"
												class="btn billButton font-h3 ">LOGIN</button>


										</div>

										<c:if test="${ not empty error}">${error}</c:if>
									</form>
								</div>
							</div>
						</div>
						
		    		</div>
		    		</div>
		    	</div>
		    </div>
	
    </div>
	<div id="is-mobile" class="show">

	 <!-- Swiper -->
    <div class="swiper-container" style="height: 145%;">
        <div class="swiper-wrapper">
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_1.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_2.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_3.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_4.jpg)"></div>
         <div class="swiper-slide" style="background-image:url(slider-resource/slide_5.jpg)"></div>
     	</div>
     	
        <!-- Add Pagination -->
        <div class="swiper-pagination" ></div>
      <div class="" style="position: absolute;height: calc(100vh);margin-top: 64px;display: flex;flex-direction: column;justify-content: left;align-items: left;z-index: 997;top: 0px;width: 100%;">    		
				<div class="row">	
				<div class="col-md-12 margin-bottom-10 front-steps-wrapper">
						
					<div class="col-lg-8 col-md-8 col-sm-8">
							<div style="margin-top: 8%; padding-left: 6%;">
								<h2 class="tag-line">
									Welcome to the<br> network that never stops
								</h2>
							</div>
					</div>	 
						
					   
					   <div class="col-md-4 col-sm-4  pb-30">
					    
							<div class="loginBoxSqr" style="padding-left: 55px;">
								<h3 style="font-size: 24px">Login</h3>
								<div class="content-form-page">


									<form class="form-horizontal form-without-legend"
										role="form" action="login" method="post" >
										<div class="form-group">

											<div class="col-lg-12 pb-20">
												<input  type="text" id="mystoicid"
													style="font-size:24px;" placeholder="My One8 ID " />
											</div>
										</div>
										<div class="form-group">

											<div class="col-lg-12 pb-10">
												<input path="password" type="password" id="password"
													style="font-size:24px;" placeholder="My One8 Password " />
											</div>
											<div class="col-md-12">
												<a style="color: #989494;" href="#">I forgot my One8
													Password</a>
											</div>
											<div class="col-md-12">
												<input id="remember" type="checkbox" name="remember"
													value="remember"> &nbsp; <label for="remember"
													class="font-h4"> Remember me </label>
											</div>
										</div>
										<div class="row" style="text-align: right;">
											<!-- added ID for button for testing -->
											<button type="submit" id="submitButton"
												class="btn billButton font-h3 ">LOGIN</button>


										</div>

										<c:if test="${ not empty error}">${error}</c:if>
									</form>
								</div>
							</div>
						</div>
						
		    		</div>
		    		</div>
		    	</div>
		    </div>
	
    </div>
	
   	
        
        
   

    
		
	
	
	<jsp:include page="component/footerLogin.jsp"></jsp:include>
	<jsp:include page="component/js.jsp"></jsp:include>


	<!-- jQuery -->
	<script src="slider-resource/swiper.min.js"></script>
	<script src="plugins/jquery.min.js"></script>     
    <script src="bootsrap/js/bootstrap.min.js"></script>     
	

    <!-- Initialize Swiper -->
    <script>
	
   
   var isMobile = {
                Android: function () {
                    return navigator.userAgent.match(/Android/i);
                },
                BlackBerry: function () {
                    return navigator.userAgent.match(/BlackBerry/i);
                },
                iOS: function () {
                    return navigator.userAgent.match(/iPhone|iPad|iPod/i);
                },
                Opera: function () {
                    return navigator.userAgent.match(/Opera Mini/i);
                },
                Windows: function () {
                    return navigator.userAgent.match(/IEMobile/i);
                },
                any: function () {
                    return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
                }};

            jQuery(function ($) {
                if (!isMobile.any())
                {
                
                 $('#is-mobile').toggleClass('show hide');}
                 else{
                  
                 $('#is-desktop').toggleClass('show hide');}
            });

			
   var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 0,
        centeredSlides: true,
        autoplay: 4000,
        autoplayDisableOnInteraction: false
    });
    </script>

	
	</body>
</html>
