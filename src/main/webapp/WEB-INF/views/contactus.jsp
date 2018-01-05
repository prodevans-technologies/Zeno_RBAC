<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>ONE8</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta content="ONE8 User Portal" name="description">
        <meta content="ONE8 User Portal Keywords" name="keywords">

        <!--  include the all css components -->
        <jsp:include page="component/css.jsp"></jsp:include>
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,600,700" rel="stylesheet">
            <style type="text/css">
                .submitButton {
                    margin-top: 10%;
                    margin-bottom: 10%;
                    width: 70%;
                    height: 5%;
                    background-color: #010745;
                    color: #FFF;
                    border-color: #010745;
                }

                .rotate {
                    display: inline-block;
                    filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
                    /* -webkit-transform: rotate(270deg); */
                    -ms-transform: rotate(270deg);
                    transform: rotate(270deg);
                    text-align: center;
                }

                .google-map {
                    position: relative;
                    margin-top: 10px;
                    height: 200px;
                }

                input[type="text"] {
                    height: 40px;
                    font-size: 19px;
                    width: 98% !important;
                }
                .billButton{
                    padding-right: 2%;

                    padding-left: 2%;
                }
                #map {
                    width: 100%;
                    height: 250px;
                    background-color: grey;
                }
                h3{
                    margin: unset;
                }
                h6
                {
                    font-weight: 100 !important;
                }
                #myAlert{
                color: blue;
                position: absolute;
               	bottom: 30px;
                left: 350px;
                font-size:16px;
                background-color: #fff;
                border: 1px #008000 solid;
            }
            </style>

        </head>

        <body class="corporate">

            <!--  include menubar -->
        <jsp:include page="component/menubar.jsp"></jsp:include>	


            <div class="col-md-12 firstRow pt-20" style="background-image: url('corporate/img/backb.png');">
                <div class="paddingLeftTop font-h1" >Contact</div>
            </div>



            <div class="pt-40">
                <div class="container">
                    <div class="col-md-12 pt-40">
                        <div class="col-md-4">
                            <div>
                                <div class="font-h3">Address</div>
                                <p>
                                    Novel Tech Park, 3rd Floor,<br> No. 46/4 Garvebhavi Palya
                                    Hongasandra,<br> Hosur Road, Bengaluru,<br> Karnataka
                                    560068.
                                </p>
                            </div>

                            <div>
                                <div>
                                    <div class="font-h3">Contact</div>
                                    <p>+91 - 99019602602</p>

                                </div>
                                <div>
                                    <div class="font-h3">Mail</div>
                                    <p>
                                        <a style="color: black" href="mailto:info@oneeight.co.in">info@oneeight.co.in</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div id="map" ></div>
                        </div>


                    </div>

                </div>
                <div class="container pt-40">

                <form:form class="row" action="contactusRequestPage" method="post" modelAttribute="contactusDetails">

                    <div class="col-md-12 pb-20">
                        <div class="col-md-6">
                            <form:input type="text" path="name" id="name"  value="${user_details.getFirst_name() }" placeholder="Name" class="font-h2" />
                        </div>
                        <div class="col-md-6 mb-pt-30">
                            <form:input type="text"  path="email_id" id="email_id"  value="${user_details.getEmail() }"  placeholder="Email" class="font-h2" readonly="true" />
                        </div>
                    </div>
                    <div class="col-md-12 pb-40">
                        <div class="col-md-12">
                            <form:input type="text" path="subject" id="subject" required="required"  placeholder="Subject" class="font-h2" style="width:99% !important;" />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-12 ">

                            <form:textarea path="message" id="message"  required="required"
                                           style="height:150px; width: 99%; border: 0.6px solid #bdc3c7; resize: none; color: black; border-radius: 0.4px; font-size: 19px;"
                                           placeholder=" Message"></form:textarea>
                            </div>
                            <div class="col-md-12" style="margin-top:1.5%;margin-bottom:1.5%; text-align: right;margin-left: -1%;">
                                <button id="csendnow" class="btn billButton" type="submit">SEND NOW</button>
                            </div>
                        </div>

                </form:form>
            </div>

        </div>

		<!-- pop up message for response message -->
		
		<c:if test="${not empty msg }">
            <div id="myAlert" class="alert alert-danger">
                <a href="${pageContext.request.contextPath }/contactusPage" class="close">&times;</a>
            <c:out value="${msg }"></c:out>
            </div>
        </c:if>
        
            <!-- included pop up -->
        <jsp:include page="component/pop-up.jsp"></jsp:include>

        <jsp:include page="component/footer.jsp"></jsp:include>


            <!-- Included for the map -->
            <script type="text/javascript">
                function initMap() {
                    var uluru = {lat: 12.9024492, lng: 77.6318219};
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 15,
                        center: uluru
                    });
                    var marker = new google.maps.Marker({
                        position: uluru,
                        map: map
                    });

                }
            </script>
            <!-- Load javascripts at bottom, this will reduce page load time -->
        <jsp:include page="component/js.jsp"></jsp:include>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8lEpXR-Ni1-PLpVrs3V4ofgmKyK6OwYI&callback=initMap"></script> 
        
        
        
        <style>
            body{
                font-weight: 300;
            }
        </style>
        <!-- END BODY -->
    </body>
</html>