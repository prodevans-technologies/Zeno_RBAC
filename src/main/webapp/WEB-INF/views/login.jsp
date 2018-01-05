
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="img/favicon.ico">
<meta charset="utf-8">
<title>ONE8</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="ONE8 User Portal" name="description">
<meta content="ONE8 User Portal Keywords" name="keywords">

<link href="https://fonts.googleapis.com/css?family=Roboto:300"
	rel="stylesheet">
<!--  include the all css components -->
<jsp:include page="component/css.jsp"></jsp:include>
<style type="text/css">
body {
	font-weight: 300;
	font-family: Roboto;
}

.row {
	margin: unset;
}

.form-info {
	border: unset;
	padding-left: 1px !important;
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
	width: 88% !important;
}
.pt-15Per
{
	padding-top: 15%;
}

.plWelcomeText
{
	padding-left: 6.2%;
}
@media ( max-width : 480px) 
{
	.front-steps-wrapper h2, .ecommerce .front-steps-wrapper h2 tag-line
	{
		font-size: 40px !important;
	}
	.pt-40{
		padding-top: 20px;
	}
	.plWelcomeText
	{
		padding-left: 4.2%;
	}
	.loginBoxSqr
	{
		margin-bottom: 10%;
	}
}

@media ( max-width : 750px) 
{
	.loginBoxSqr
	{
		width: 95% !important;
	}
	.form-info
	{
		padding-left: 8% !important;
		padding-top: 1px !important;
	}
	.pt-15Per
	{
		padding-top: 10% !important;
	}
}

@media ( max-width :1366px ) and (min-width:1024px)
{
	.plWelcomeText
	{
		padding-left: 8%;
	}
	.pt-15Per
	{
		padding-top: 18%;
	}
	.loginBoxSqr
	{
		width: 86% !important;
		margin-top: 10% !important;
	}
	
}
</style>
</head>

<body class="corporate">

	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">
			<a class="site-logo" href="#"> <img
				src="corporate/img/logos/logo.png" alt="ONE8">
			</a> 
			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation pull-right font-transform-inherit"
				style="font-size: 12px">
				
			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->
	<div class="">
		<div class="row">
			<!-- BEGIN STEPS -->
			<div class="row margin-bottom-10 front-steps-wrapper">
				<div style="background: url('img/slide_1.jpg'); min-height: 500px">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-8  ">
							<div class="pt-15Per plWelcomeText">
								<h2 class="tag-line">
									Welcome to the<br> network that never stops
								</h2>
							</div>
						</div>
                                            <div class="col-md-4 col-sm-4  pb-20" style="padding-top: 4.8%;">
							<div class="form-info loginBoxSqr">
								<h3 style="font-size: 24px; color:white;">Login</h3>
								<div class="content-form-page">


									<form:form class="form-horizontal form-without-legend"
										role="form" action="login" method="post" modelAttribute="user">
										<div class="form-group">

											<div class="col-lg-12 pb-20">
												<form:input path="customer_id" type="text" id="mystoicid"
													style="font-size:18px;" placeholder="My One8 ID " />
											</div>
										</div>
										<div class="form-group">

											<div class="col-lg-12 pb-10">
												<form:input path="password" type="password" id="password"
													style="font-size:18px;" placeholder="My One8 Password " />
											</div>
											<div class="col-md-12">
												<!-- <a style="color: #989494;" href="#">I forgot my One8
													Password</a>
												 -->	
											</div>
                                                                                        <div class="col-md-12 pb-20" >
                                                                                
                                                                                </div>
<!--											<div class="col-md-12">
												<input id="remember" type="checkbox" name="remember"
													value="remember"> &nbsp; <label for="remember"
													class="font-h4"> Remember me </label>
											</div>-->
										</div>
										<div class="row" >
										
											<div class="col-md-9 col-xs-12">
												<c:if test="${ not empty error}">
													
													<span  class="glyphicon glyphicon-alert" style="color: red;margin-top: 6.5%;" >
														<span style="color: red;font-family: Roboto;font-size: 15px;">
															${error}
														</span>
													</span>
												</c:if>
											
											</div>
											<div class="col-md-3 col-xs-12" style="text-align: right;">
											
												<button type="submit" id="submitButton" class="btn billButton font-h3 ">
													LOGIN
												</button>
											
											</div>
										
												
										
											

										</div>

										
									</form:form>
								</div>
							</div>
						</div>
						
					</div>

				</div>
			</div>
			<!-- END STEPS -->
		</div>
	</div>
	<!-- END PRE-FOOTER -->

	<jsp:include page="component/footerLogin.jsp"></jsp:include>


	<!-- Load javascripts at bottom, this will reduce page load time -->
	<jsp:include page="component/js.jsp"></jsp:include>
	<!-- END BODY -->
</body>

</html>