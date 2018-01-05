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
        <meta content="vikram" name="author">

        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">


        <!--  include the all css components -->
        <jsp:include page="component/css.jsp"></jsp:include>


        </head>
        
<style type="text/css">
p {
	margin: 0 0 2px;
}
</style>

<body class="corporate">

	<!--  include menubar -->
	<jsp:include page="component/menubar.jsp"></jsp:include>

	<div class="col-md-12 firstRow pt-20"
		style="background-image: url('img/red_long.png');">
		<h1 class="paddingLeftTop" >Privacy Policy</h1>
	</div>


	<div class="container ">
		<!-- BEGIN CONTENT -->
		<div class="col-md-12 pt-40">


			<p class="font-h3">What this privacy policy covers?</p>
			<p class="font-h4">Technologies ("Company") treats personal
				information that the Company collects and receives, including
				information related to your past use of the Company's products and
				services. Personal information is information about you that is
				personally identifiable like your name, address, email address, or
				phone number etc.</p>

			
			<p class="font-h3">Information Collection and Use</p>
			<p class="font-h4">General</p>
			<p class="font-h4">
				The company has the right to combine information about you that it
				has, with information from partner business and has the right to
				pass on the same to business associates, franchisees without
				referring the same to the user. <br>
				 We store personal information that you give us, for a
				specific purpose. This includes details such as your name, address,
				telephone, VC number, account number and/ or e-mail address. This
				Privacy Policy is applicable all the personal information that you
				give us ("User Information") via this website.
			</p>
		
			<p class="font-h3">We make use of User Information for the
				following:</p>
			<p class="font-h4">
				Market research, including statistical analysis of user behaviour
				which we may disclose to third parties in aggregated form. <br /> In
				compliance with any requirement of law.<br /> Send you
				periodic communications about our features, products, services,
				events and special offers.
			</p>

			
			<p class="font-h3">Information Sharing and Disclosure</p>
			<p class="font-h4">
				ONE8<sup>TM</sup> and its authorized third parties will
				collect information pertaining to your identity, demographics, and
				related evidentiary documentation. <br>  ONE8<sup>TM</sup>
				may at its discretion employ, contract or include third external to
				itself for strategic, tactical and operational purposes. Such
				agencies though external to ONE8<sup>TM</sup>, will always
				be entities which are covered by non-disclosure agreements. <br> 
				We may also share your personal information with Government agencies
				or other authorized law enforcement agencies (LEAs) mandated under
				law to obtain such information for the purpose of verification of
				identity or for prevention, detection, investigation including but
				not limited to cyber incidents, prosecution, and punishment of
				offences.
			</p>

		
			<p class="font-h3">Changes to this Privacy Policy</p>
			<p class="font-h4">The Company may update this policy and display
				the same in their website without notice to you and such posting
				will be deemed to have been read by you.</p>

		</div>

	</div>

	<div style="padding-top: 2%"></div>


	<jsp:include page="component/pop-up.jsp"></jsp:include>
	<jsp:include page="component/footer.jsp"></jsp:include>

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<jsp:include page="component/js.jsp"></jsp:include>


	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>