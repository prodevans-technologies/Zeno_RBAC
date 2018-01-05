<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="utf-8">
<title>ONE8</title>
<link rel="shortcut icon" href="favicon.ico">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="ONE8 User Portal" name="description">
<meta content="ONE8 User Portal Keywords" name="keywords">

<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<!-- Fonts START -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
	
<!--  include the all css components -->
<jsp:include page="component/css.jsp"></jsp:include>

<style type="text/css">
h1{
	margin:unset;
}
.font-h3
{
	font-size: 20px;
}
.col-md-3
{
	padding: 0px;
}
.col-md-6, col-sm-8
{
	padding-left: 1px;
	padding-right:1px;
}
.mainBlock41
{
	width :92%;
	max-width: 310px;
	max-height:260px;
	min-height:250px;
	color:white;
	padding:4%;
	padding-top:10px;
	background-color: #FFB819;
	text-align: center;
	margin:auto;
	margin-top:5%;
	-webkit-box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
	-moz-box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
	box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
}
.circle-Font
{
	min-height:90px;
	max-width:90px;
	border: 0px solid white;
	border-radius: 50%;
	font-size: 58px;
	font-weight: bold;
	text-align: center;
	margin-left: 15%;
	margin-top: 8px;
}

#floating-button
{
	background: #9cafad !important;
}

@media ( max-width : 766px) 
{
	.circle-Font
	{
		margin-left: 5% !important;
	}
	.col-xs-5
	{
		width: 35%;
	}
}

@media (max-width:1083px){
	.circle-Font{
		margin-left: 15%;
	}
}

@media (max-width:1340px){
	.circle-Font{
		margin-left: unset;
	}
}

/* @media (max-width : 886px) 
{
	.paddingLeftMobile
	{
		padding-left: 40px;
	}
	.col-md-6
	{
		padding-left: 0px;
		padding-right: 5%;
		margin-left: -5%;
	}
	.col-md-4
	{
		padding-left: 7% !important;
		padding-right: 7% !important;
	}
	.fs-44
	{
		font-size: 32px;
	}
	
	.col-md-10, .col-xs-12
	{
		padding-left: 2.2% !important;
	}
	
} */
/* TABLET LANDSCAPE / DESKTOP */
/* @media (max-width:1340px) and (min-width:991px)
{	
	
	.circle-Font
	{
		min-height:60px;
		max-width:60px;
		border: 3px solid white;
		border-radius: 50%;
		font-size: 42px;
		font-weight: bold;
		text-align: center;
		margin-left: 15%;
		margin-top: 10px;
	}
	h1
	{
		padding-top: 12px;
	}
} */


</style>

</head>
<body class="corporate" style="font-family: Roboto;">

<!--  include menubar -->
<jsp:include page="component/menubar.jsp"></jsp:include>	

<!--  <div class="col-md-12 firstRow pt-20" style="background-image: url('img/yellow_long.png');">
    <h1 class="paddingLeftTop">Get more out of One8</h1>
</div>
-->

<div class="row firstRow pt-20"
          style="background-image: url('${pageContext.request.contextPath }/corporate/img/backb.png');" style="clear: both">
        <!--  <h1 class="paddingLeftTop" >Parental Control</h1> <h1 class="paddingRight" >Hi Vamsi </h1>  -->
        <div class="col-md-5 col-sm-5" style="padding-left: 4.9%;">
            <h1>Get more One8 on demand</h1>
        </div>
        <div class="row firstRow pt-20" style="padding-right: 5%;margin-bottom: -20px;margin-top: -10px;text-align:right;">
            <b style="float: right">${user.getActname()}<br/>${user.getActid()}</b><br/>
           <!--   <h4 style="float: right">${user.getActid()}</h4>-->
        </div>

    </div>	
<div class="container">
		<div class="col-md-12 col-xs-12" style="text-align:center">
			<h1>Pick an option, pay and browse non stop.</h1>
		</div>
		<!-- <div class="col-md-10 col-xs-12">
			  <h1 style="padding-bottom: 3px;">Get more One8 on demand</h1>
			<h3>Pick an option, pay and browse non stop.</h3>
		</div>-->
</div>

<div class="col-md-12 col-lg-12 col-xl-12 ">
	<div class="container" style="margin-bottom: 2.5%;">
		<div class="col-md-2 col-sm-2  ">
		</div>
		<div class="col-md-4 col-sm-4 ">
			<div class="mainBlock41" style="background-color: #ffb81c;">
				<div class="row" style="padding-right: 2%;">
					<div class="col-md-4 col-xs-4"></div>
					<div class="col-md-4 col-xs-5">
						<h1 class="circle-Font">
							05
						</h1>
					</div>
					<div class="col-md-4 col-xs-3" style="padding-top: 10%;text-align: left;padding-left: 0% !important;">
						<h2>GB</h2>
					</div>
				</div>
				<h1 style="padding-top: 10px;">&#8377; 120</h1>
				<h4>512 Kbps  &#9679;  POST FUP</h4>
				<a href="toup50GB?planName=Add on 5GB" style="margin-left: 2%;">
					<div class="btn billButton" style="border: 0.1px solid white;background-color: inherit;">
						BUY NOW
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-4 col-sm-4 ">
			<div class="mainBlock41" style="background-color: #F44336;">
				<div class="row" style="padding-right: 2%;">
					<div class="col-md-4 col-xs-4"></div>
					<div class="col-md-4 col-xs-5">
						<h1 class="circle-Font">
							10
						</h1>
					</div>
					<div class="col-md-4 col-xs-3" style="padding-top: 10%;text-align: left;padding-left: 0% !important;">
						<h2>GB</h2>
					</div>
				</div>
				<h1 style="padding-top: 10px;">&#8377; 220</h1>
				<h4>512 Kbps &#9679; POST FUP</h4>
				<a href="toup50GB?planName=Add on 10GB" style="margin-left: 2%;">
					<div class="btn billButton" style="border: 1px solid white;background-color: #F44336;">
						BUY NOW
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-2  ">
		</div>
	</div>
</div>






	<jsp:include page="component/pop-up.jsp"></jsp:include>
	<div style="margin:3%;"></div>
	<jsp:include page="component/footer.jsp"></jsp:include>
	
	
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<jsp:include page="component/js.jsp"></jsp:include>
	<!-- END BODY -->
</body>

</html>