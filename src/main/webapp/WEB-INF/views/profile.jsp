<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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

.font-h3
{
	font-size: 20px;
}
.col-md-4
{
	padding: 0px;
}
.col-md-6, col-sm-8
{
	padding-left: 1px;
	padding-right:1px;
}
.mainBlock4
{
	width :100%;
	min-height:270px !important;
	max-height:270px !important;
	color:black;
	margin: 5%;
	padding-left:5%;
	max-height:unset;
	margin-top:10%;
	-webkit-box-shadow: 2px 4px 8px 0px rgba(192,192,192,0.3);
	-moz-box-shadow: 2px 4px 8px 0px rgba(192,192,192,0.3);
	box-shadow: 2px 4px 8px 0px rgba(192,192,192,0.3);
}
.row
{
	margin: unset;
}
@media (max-width : 650px) 
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
	.mainBlock4
	{
		max-height: 100%;
		min-width: 100%;
		margin-top: 5%;
	}
	h1
	{
		font-size: 27px !important;
	}
}
@media (max-width : 370px) 
{
	h1, h2
	{
		font-size: 24px;
	}
	.font-h3
	{
		font-size: 16px;
	}
}

@media ( max-width :1921px) and (min-width:1340px) 
{
	.mainBlock4
	{
		min-width: 88% !important;
	}
}
</style>

</head>
<body class="corporate" style="font-family: Roboto;">
	
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
                                    <li><a  href="${pageContext.request.contextPath }/billingPayment">PAY YOUR BILL</a></li>
                                    <li><a href="${pageContext.request.contextPath }/control">SURF
                                            SAFE</a></li>
                                    <li><a href="${pageContext.request.contextPath }/service">SERVICE</a></li>

                                    <li class="active"><a href="${pageContext.request.contextPath }/profile">PROFILE</a></li>
                                    <li><a href="${pageContext.request.contextPath }/logout">LOGOUT</a></li>
				</ul>
			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->

<div class="col-md-12 firstRow pt-20" style="background-image: url('corporate/img/backb.png');">
    <h1 class="paddingLeftTop" >Login contact and details</h1>
</div>
	
<div class="container">
	<div class="col-md-121">
		<div class="col-md-6 col-sm-12">
			<div class="mainBlock4">
				<h2 class="pb-20 pt-20">Account details</h2>
				
				<div class="pb-10 row">
					<div class="col-md-4 col-xs-4">
						<h3 class="font-h3">Account ID:</h3>
					</div>
					<div class="col-md-7 col-xs-8">
						<h3 class="font-h3">${profile.getActid() }</h3>
					</div>
				</div>
				<div class="pb-10 row">
					<div class="col-md-4 col-xs-4">
						<h3 class="font-h3">Password:</h3>
					</div>
					<div class="col-md-7 col-xs-8">
						<h3 class="font-h3">&#9679; &#9679; &#9679; &#9679; &#9679; &#9679; 
					
					<a href="#changePassword" data-toggle="modal"  style="color:black;">
							<!--  <h4 style="color:#0066cc;">Edit password &nbsp &nbsp <img alt="pencil" src="img/pencil.png" style="width:30px;height: 30px;margin-bottom: 10%;"></h4>-->
						   
      
						    <img data-toggle="tooltip" class="floatingRight" title="Edit password" alt="Edit password" src="img/edit.png" style="width:20px;height:20px;margin: 5%;">
						</a></div>
				</div>
				<div class="row pb-10">
					<div class="col-md-7 col-xs-5">
					</div>
					<div class="col-md-5 col-xs-7" >
						
					</div>
					<h3 style="color:#0066cc; text-align: center; font-size:15px;"><b>
                <c:if test="${ not empty result}">${result}</c:if></b></h3>
				</div>
				
			</div>
		</div>
		
		<div class="col-md-6 col-sm-12">
			<div class="mainBlock4" >
				
				<div class="row pb-10 pt-20">
					<div class="col-md-4 col-xs-4">
						<h3 class="font-h3">Mobile:</h3>
					</div>
					<div class="col-md-7 col-xs-8">
						<h3 class="font-h3">${profile.getMobileno() }</h3>
					</div>
				</div>
				<div class="row pb-10">
					<div class="col-md-4 col-xs-4">
						<h3 class="font-h3">Email ID:</h3>
					</div>
					<div class="col-md-7 col-xs-8">
						<h3 class="font-h3">${profile.getEmail() }</h3>
					</div>
				</div>
				<div class="row pb-10">
					<div class="col-md-4 col-xs-4">
						<h3 class="font-h3">Address:</h3>
					</div>
					<div class="col-md-7 col-xs-8">
						<h3 class="font-h3">${profile.getAddress() }</h3>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>


<!-- Modal Code for Change Password -->
<div id="changePassword" class="modal fade" style="margin-top:5%;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="color:white;background-color: #0066cc;padding-top: 3%;padding-bottom: 3%;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color:#FFF">
                	<img alt="" src="img/close.png" style="height: 25px;width: 25px;">
                </button>
                <h4 class="modal-title" style="padding-left: 5%;">Change Password</h4>
            </div>

            <div class="modal-body" style="margin-bottom:30%">
              <div class="col-md-12 col-sm-12" style="margin-top:8%">

					<form:form role="form" action="profile/change-pass" method="post" modelAttribute="change_pass">
						<form:input type="hidden"  path="actid" readonly="true" />
						<form:input path="password" type="password" style="margin-bottom:30px;" placeholder="Enter Password" required="true" value=""/>
						<form:input path="confirm_password" type="password" style="margin-bottom:23px;" placeholder="Confirm Password" required="true" value=""/>
						<button type="submit" class="btn billButton pull-right" style="">UPDATE</button>
					</form:form>
					
                 
                 
              </div><!-- Col-md-12 -->
            </div><!-- Modal Body -->
        </div>
    </div>
</div>



	
	
	<jsp:include page="component/pop-up.jsp"></jsp:include>
	<div style="margin:1%;"></div>
	<jsp:include page="component/footer.jsp"></jsp:include>
	
	
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<jsp:include page="component/js.jsp"></jsp:include>
	<!-- END BODY -->
</body>

</html>