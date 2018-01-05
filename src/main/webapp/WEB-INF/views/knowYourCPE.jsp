<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>

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
<jsp:include page="component/css.jsp"></jsp:include>

<style>
.leftSidePanelIMG
{
	width: 90%;
	height: 45%;
}
.backPanelIMG
{
	width: 75%;
	height: 35%;
}
@media (max-width : 750px) 
{
	.leftSidePanelIMG
	{
		height: 45%;
		padding-bottom: 50px;	
	}
	.backPanelIMG
	{
		width: 75%;
		height: 35%;
	}
}
@media (max-width : 480px) 
{
	.leftSidePanelIMG
	{
		height: 45%;
		padding-bottom: 50px;	
	}
	.backPanelIMG
	{
		width: 85%;
		height: 35%;
	}
}
</style>


</head>

<body class="corporate" style="font-family: Roboto;">

<!--  include menubar -->
<jsp:include page="component/menubar.jsp"></jsp:include>	



<div class="col-md-12 firstRow pt-20" style="background-image: url('corporate/img/backb.png');">
    <h1 class="paddingLeftTop" >Know your One8 Cube</h1>
</div>    

  <div class="col-md-12 sRow pt-20" style="padding-left:5%">
  <h1 class="paddingLeftTop"> The One8 Cube</h1>
  <div style="padding-left:2%">
<ul>
                     <p class="faqp paddingLeftTop pt-20"  ><li>Hotspot router that connects all your wifi devices</li></p>
                    <p class="faqp"><li>2 USB ports: plug in hard drives,Keyboard and more</li></p>
                     <p class="faqp"><li>HDMI port: plug in your TV and surf!</li></p>
                     <p class="faqp"><li>Entertainment ON! Constantly curated,pre-loaded</li></p>
                    <p class="faqp"><li>Apps like Youtube,TED,Gmail,Facebook and more</li></p>
                                       

                     </ul> </div></div>
<div class="container" align="center">
	<div class="col-md-12 sRow pt-20" align="left">
	<div class="row">
		<div class="col-md-12 col-sm-12">

			<div class="col-md-6 col-sm-6" style="padding-right:-5%;">
				
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<img class="leftSidePanelIMG" alt="Left Side Panel" src="corporate/img/leftPanel.PNG" >
					</div>
				</div>
			</div>
			
			<div class="col-md-6 col-sm-6">
				<div class="row pb-20" >
				
					
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<img class="backPanelIMG" alt="Back Panel" src="corporate/img/rightPanel.png" >
					</div>
				</div>
			</div>
			
		</div>
	</div>
	</div>
</div>

	<!-- included pop up -->
	<jsp:include page="component/pop-up.jsp"></jsp:include>

	<jsp:include page="component/footer.jsp"></jsp:include>


	<!-- Load javascripts at bottom, this will reduce page load time -->
	<jsp:include page="component/js.jsp"></jsp:include>
	<!-- END BODY -->
</body>
</html>