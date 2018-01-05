<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<!-- Head BEGIN -->
<head>
<head>
<meta charset="utf-8">
<title>ONE8</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="ONE8 User Portal" name="description">
<meta content="ONE8 User Portal Keywords" name="keywords">

<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">
<!--  include the all css components -->
<jsp:include page="component/css.jsp"></jsp:include>

<style>
.row {
	margin: unset;
}
</style>

</head>
<body class="corporate">

	<!--  include menubar -->
	<jsp:include page="component/menubar.jsp"></jsp:include>



 
<div class="row firstRow pt-20" style="background-image: url('corporate/img/backb.png');">
    <h1 style="margin-left: 4.8%;" >Refund  And  Cancellation</h1>
</div>


	<div class="container ">
		<div class="pt-40" >
		<p class="faqp1"> Once purchased, no refunds or cancellations will be accommodated. Any disputes with regard to payment/refund of transaction(s) due to technical reasons are subject to arbitration/resolution on a case to case basis.

</p>
			</div>
	</div>
	<!-- END CONTENT -->


	<div style="padding-top: 22%"></div>

	<jsp:include page="component/footer.jsp"></jsp:include>

	<jsp:include page="component/pop-up.jsp"></jsp:include>

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<jsp:include page="component/js.jsp"></jsp:include>


	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>