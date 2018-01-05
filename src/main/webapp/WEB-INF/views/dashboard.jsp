<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <title>ONE8</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="ONE8 User Portal" name="description">
    <meta content="ONE8 User Portal Keywords" name="keywords">
    <!--  include the all css components -->
    <jsp:include page="component/css.jsp"></jsp:include>

    <jsp:include page="component/parental_check_js.jsp"></jsp:include>

        <style>
            canvas {
                -moz-user-select: none;
                -webkit-user-select: none;
                -ms-user-select: none;
            }

            .mainBlock4{
                max-width: unset;
                margin-top: 15%;
                max-width: 92.5%;
                min-height:330px;
            }

            .div2{
                max-width : 96%;
                margin-top:7.5%;
                min-height:330px;
                border : none;
                padding: unset;
                -webkit-box-shadow: 2px 4px 8px 0px rgba(192,192,192,0.3);
                -moz-box-shadow: 2px 4px 8px 0px rgba(192,192,192,0.3);
                box-shadow: 2px 4px 8px 0px rgba(192,192,192,0.3);
            }
            .firstRow{
                background-image: url('img/red_small.png');
                background-size: cover;
                padding-left: 4.8%;
            }
            .row{
                margin:unset;
            }
            /* iphone 6 plus*/

            @media ( max-width : 991px) 
            {
                .mainBlock4
                {
                    max-width: 98% !important;
                    margin-top: 10%;
                }
                .div2{
                    max-width: 98% !important;

                }
                .col-md-12
                {
                    padding-left: 2.8% !important;
                }
            }
            @media ( max-width : 1023px) 
            {
                h1
                {
                    font-size: 28px;
                }
                .div2{
                    min-width: 98% !important;

                }
            }
            @media ( max-width : 680px) 
            {
                .col-md-12
                {
                    padding-left: 1.5% !important;
                }
            }
            @media ( max-width : 570px) 
            {
                h1
                {
                    padding-top: 20px;
                }
                .pt-20M
                {
                    padding-top: 1px;
                }
                .mainBlock4
                {
                    max-width: 98% !important;
                    margin-top: 5%;
                }
                .div2{
                    max-width: 100% !important;

                }
                .col-md-12
                {
                    padding-left: 5px;
                }
            }
            @media ( max-width :1279px) and (min-width:1024px) 
            {
                .div2
                {
                    min-height: 330px !important;
                }
            }


        </style>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {
                'packages': ['corechart', 'line']
            });
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                /* var data = google.visualization.arrayToDataTable([
                 ['Year', 'Sales', 'Expenses', 'other'],
                 ['2004',  1000,      400, 500],
                 ['2005',  1170,      460, 300],
                 ['2006',  660,       1120, 200],
                 ['2007',  1030,      540, 100]
                 ]);*/
                var jsonData = $.ajax({
                    url: "user-session",
                    dataType: "json",
                    async: false
                }).responseText;
                var options = {
                    title: 'Data Usage',
                    curveType: 'none',
                    colors: ['#ff6f00', '#00c853', '#2196f3'],
                    hAxis: {
                        title: "Time in week (${SubscriptionDetails.getStartdt() } - ${SubscriptionDetails.getExpirydt() })",
                        ticks: [{
                                v: 0,
                                f: ''
                            }, {
                                v: 30,
                                f: ''
                            }]
                    },
                    vAxis: {
                        title: 'Data in GigaBytes',
                        ticks: [0]
                    },
                    pointSize: 4,
                    legend: {position: 'bottom'}
                };
                // Create our data table out of JSON data loaded from server.
                var data = new google.visualization.DataTable(jsonData);
                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
                chart.draw(data, options);
            }
    </script>

</head>
<body class="corporate" style="font-family: Roboto;">
    <!-- BEGIN HEADER -->

    <div class="header">
        
        <div class="row">
             <div class="col-md-12 pt-10" style="color: #2980b9; text-align: right; line-height: 5px;">
                 <p> ${user_details.getFirst_name() } / ${user_details.getActid() }</p>
        </div>

            <a class="site-logo" href="#"> <img src="corporate/img/logos/logo.png" alt="ONE8">
            </a> <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>
            <!-- BEGIN NAVIGATION -->
           
            <div class="header-navigation pull-right font-transform-inherit" style="font-size: 12px">
                <ul>
                    <li class="dropdown active"></li>
                    <li class="active"><a href="${pageContext.request.contextPath }/dashboard">MY ONE8</a></li>
                    <li><a href="${pageContext.request.contextPath }/billingPayment">PAY YOUR BILL</a></li>
                    <li><a href="${pageContext.request.contextPath }/control">SURF SAFE</a></li>
                    <li><a href="${pageContext.request.contextPath }/service">SERVICE</a></li>
                    <li><a href="${pageContext.request.contextPath }/profile">PROFILE</a></li>
                    <li><a href="${pageContext.request.contextPath }/logout">LOGOUT</a></li>
                </ul>
            </div>
            <!-- END NAVIGATION -->
        </div>
    </div>
    <!-- Header END -->
    <div class="row">
        <div class="col-md-4 col-sm-12  firstRow pt-20">
            <h1 style="color: white; ">Manage your network</h1>
        </div>
        <div class="col-md-8 col-sm-12 pt-20 pt-20M" style="background-color: #ecf0f1;min-height: 116px;">
            <div class="col-md-12">
                <h1 style="color: black;" class="currentBillFontforiPhone5">Welcome <b style = "color:#F44336"> ${user_details.getFirst_name() }</b>, to your One8 page</h1>
                <!--  <p class="sampleClass">Parental Control</p> -->
            </div>
        </div>
    </div>

    <div class="container" style="margin-bottom: 3%;">
        <div class="col-md-4">
            <div class="mainBlock4" style="background-color: #F44336; padding-top: 5%;">
                <h3 class="pb-10">Your One8 account</h3>
                <h4 >Account Id : ${user_details.getActid() }</h4>
                <h4>Plan Name : ${SubscriptionDetails.getRatePlan() }</h4>
                <div class="pt-20 pb-10">
                    <span class="blackShadow font-h4" style="margin-right: 10px;">
                        Usage :
                    </span> 
                    <span class="blackShadow font-h2">${SubscriptionDetails.getDataUsed()}</span>GB
                    <br/>
                </div >
                <div class=" progress">
                    <div class="progressbarColor" style="width: ${SubscriptionDetails.getDataPercent()}%;"></div>
                </div>
                <h2 class="pt-10">&#8377; ${invoiceDetails.getAmount() }</h2>
                <h4 >Due in ${invoiceDetails.getRemainingDays()} days</h4>
            </div>
        </div>
        <div class="col-md-8" style="padding:unset;">
            <div class="">
                <div class="div2" id="curve_chart"></div>
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

