<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML> 

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
        <style type="text/css">
            p {
                margin: 0 0 2px;
            }
        </style>
    </head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head> 
<body> 
    <!-- Navigation -->
<jsp:include page="component/menubar.jsp"></jsp:include>

    <!-- Main container -->

    <div id="v" class="container-fluid nopadding"> 
        <!-- faq -->
        <section class="col-md-12 col-lg-12 nopadding"> 
            <div class="firstRow pt-20" style="background-image: url(img/red_long.png);" >
                <div class="col-md-12 faqheader faaqheaderpadding ">
                    <h1 class="paddingLeftTop"> FAQs</h1>
                </div>
            </div>             
        </section>
        <!-- Presenting the network that never stops -->
        <section class="col-md-12 col-lg-12" id="faq"> 
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <!--<div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            This section contains a wealth of information, related to <strong>PrepBootstrap</strong> and its store. If you cannot find an answer to your question, 
                            make sure to contact us. 
                        </div>-->
                        <br />
                        <div class="panel-group" id="accordion">
                            <h1 class="h1-font"> General</h1>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">What is One8 Cube? </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p class="faqp1">The One8 cube is the nerve centre of your One8 internet experience. It is a hotspot router and entertainment platform, all in one sleek, intelligent box. It is loaded with a music and video player, and soon, a rich selection of on-demand video streaming and gaming services along with a browser so you can surf on your television. With two USB ports and Bluetooth capabilities, you can connect external hard disks, keyboard, mouse and more. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">How many devices can I use with the One8 cube?
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p class="faqp1">Use upto 8 wifi-enabled devices (laptop, tablet, phone etc.), and that’s not all. Turn your TV into a smart TV — just plug it into the One8 Cube’s HDMI port. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Can I download apps on the One8 Cube? </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p class="faqp1">Your One8 is pre-loaded with some of the most popular apps like Youtube, TED, Gmail, Facebook and more. Our team of app curators continuously refreshes the One8 Cube, giving you the best range of pre-loaded apps to enjoy. And if there’s something more that you’re after, with our lag-free network, you can download unlimited apps on all your wifi enabled devices. </p>
                                    </div>
                                </div>
                            </div>


                            <h1 class="h1-font">New Connection </h1>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">How can I sign up for a new connection? </a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p class="faqp1">Sign up online <a class="external" href="${pageContext.request.contextPath }/newconnection" newconnection"><b>here</b></a> and our customer care executives will get in touch with you within 24 hours. </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                        What is the cost of a new connection?
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseFive" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Pay Rs 2600 for the One8 Cube and an installation service fee of Rs 750. Thereafter, depending on the plan you opt for, enjoy the convenience of post-paid billing. Note: The given prices are exclusive of applicable taxes. </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">What documents do I need to sign up?
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseSix" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp" >For One8 at home </p>
                                    <p class="faqp1">Govt issued ID Proof <br>
                                        Address Proof: Landline Bill or Rental Agreement<br>
                                        Passport size photo </p>

                                    <p class="faqp" >For One8 Corporate Connection</p>
                                    <p class="faqp1">Company Registration Copy <br>
                                        Company Pan Card <br>
                                        Certificate from Labour Department<br>
                                        VAT/GST Registration Certificate<br>
                                        Address Proof: Landline bill or Rental Agreement (if the registration address is different from the address for which connection is requested)<br>
                                        Latest Current Account Bank Statement<br>
                                        Letter from Company requesting connection on Company Letterhead with Authorised Signature and Chop<br>
                                        Memorandum Of Articles Association (MOA)<br>
                                        Authorisation Letter from CEO/MD/Director: to authorise a person as primary signatory<br>
                                        - ID Proof of Authorised Signatory<br>
                                        - Passport size Photo of Authorised Signatory </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">My connection has been activated in the middle of the month. How will this affect my bill or billing cycle?</a>
                                </h4>
                            </div>
                            <div id="collapseSeven" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">On activation, you will be charged the chosen plan cost. In the following month, we will credit the number of days that you have not used the One8 plan. For instance, if your connection was activated on 10th of September, you will be given a credit for 9 days usage in the next month’s billing, and the amount will be adjusted. The billing cycle spans 30 days, beginning on the 1st of every month. </p>

                                </div>
                            </div>
                        </div>

                        <h1 class="h1-font">Plans </h1>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">How do I choose a plan? </a>
                                </h4>
                            </div>
                            <div id="collapseEight" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">With our speed-agnostic plans, the only question you need to ask your-self is how much data you need — because with One8, lag-free speed is a guarantee. If you are unsure of how much data you typically use, start with our Basic Package. If you need more, you can Top Up with ease or migrate to a new plan at the tap of a finger. Once you finish your data for the month, while you will be able to continue surfing, as per FUP rules, your speed will be capped at 512 kbps. </p>    
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">How do I change my plan? </a>
                                </h4>
                            </div>
                            <div id="collapseNine" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Current plan too limited? Upgrade with ease <a class="external" href="${pageContext.request.contextPath }/zeno" target="_blank"><b>here</b></a>. Once we receive your request, our customer care executive will be in touch with you in 2-3 business days. </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">Can I get a low speed, low rental plan? </a>
                                </h4>
                            </div>
                            <div id="collapseTen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Your One8 plan is based solely on data consumption. Our thinking network constantly allocates the best speed, depending on what you are doing. If you want to switch to a lower rental, simply choose a smaller data package <a class="external" href="${pageContext.request.contextPath }/zeno" target="_blank"><b>here</b></a>. </p>    
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">Is there a fee for changing plans?</a>
                                </h4>
                            </div>
                            <div id="collapseEleven" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Not at all! </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">Can I upgrade my plan in the middle of a month? </a>
                                </h4>
                            </div>
                            <div id="collapseTwelve" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">While you can change plans at any time, the new plan will only take ef-fect at the beginning of the next billing cycle. </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThirteen">I have finished my data for the month. How do I top up? </a>
                                </h4>
                            </div>
                            <div id="collapseThirteen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Get your Top Up on the go <a class="external" href="${pageContext.request.contextPath }/zeno" target="_blank"><b>here</b></a>. It’s easy, quick and takes effect instantly. </p>
                                </div>
                            </div>
                        </div>
                        <!--<div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFourteen">Can I carry forward my GB?</a>
                                </h4>
                            </div>
                            <div id="collapseFourteen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">If you opt for a plan with a bigger unused GB, your unused GB from the current month will be automatically adjusted against the new plan. If you are moving to a smaller data package, then your used data will be calculated — if it is more than the limit on your new plan, the FUP will take effect immediately.  </p>
                                
                                </div>
                            </div>
                        </div>-->

                        <h1 class="h1-font">Billing </h1>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFifteen">What is my billing cycle?</a>
                                </h4>
                            </div>
                            <div id="collapseFifteen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">All our plans are on a 30-day post usage, post paid cycle. This means that you will be billed every 30 days, starting on the 1st of every month. </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSixteen">How do I pay my bill? Can I pay online and offline?</a>
                                </h4>
                            </div>
                            <div id="collapseSixteen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Paying online is super simple. Click here and pay by card or net banking through a safe and secure payment gateway. To pay online, <a class="external" href="${pageContext.request.contextPath }/payBill"><b>click here</b></a>. </p>
                                </div>
                            </div>
                        </div>

                        <h1 class="h1-font">Network </h1>                       

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeaventeen">What is the thinking network?</a>
                                </h4>
                            </div>
                            <div id="collapseSeaventeen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">There is a reason we call our network the thinking network — our power-packed analytics engine that continuously gauges the perfect speed you need for the applications you use in real time. The fact is that not every user in your home requires the same speed all the time because not every user is using the same application at the same time. The One8 network detects usage at an individual level and allocates speed accordingly to individual users— lower for an email, higher for streaming a video or a video conference. What that means is that no matter what you are doing online, you will be doing it lag-free. That’s the power of the thinking network. </p>
                                </div>
                            </div>
                        </div>

                        <h1 class="h1-font">Complaints, Shifting and Deactivation </h1>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEighteen">What do I do if my connection/ One8 Cube isn’t working?</a>
                                </h4>
                            </div>
                            <div id="collapseEighteen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Simple. Just give us a call at +91 90196 02602 and we’ll get on the job ASAP.</p>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNinteen">I am moving to a different neighbourhood. How do I shift my One8 connection? </a>
                                </h4>
                            </div>
                            <div id="collapseNinteen" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Raise a Service Request or call customer care at +91 90196 02602 for instant support. </p>    
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwenty">How do I terminate my One8 connection?</a>
                                </h4>
                            </div>
                            <div id="collapseTwenty" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">Click Service Request and opt for Termination. Our executives will contact you shortly. Service will be terminated subject to clearing of pending bills. </p>   
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwentyone">Can I use my existing (non One8) connection with the One8 Cube?</a>
                                </h4>
                            </div>
                            <div id="collapseTwentyone" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">The One8 cube is configured to work exclusively with the One8 network to ensure security and quality of service. </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwentytwo">Are there any shifting/ deactivation charges?</a>
                                </h4>
                            </div>
                            <div id="collapseTwentytwo" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <p class="faqp1">To know more about service fees, please call customer care at +91 90196 02602 for instant support. </p>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
    </section>
    <style>
        .faqHeader {
            font-size: 27px;
            margin: 20px;
        }

        .panel-heading [data-toggle="collapse"]:after {
            /* background-image: url(images/varrow2.png); 
            font-family: 'Glyphicons Halflings';*/
            font-family: 'Open Sans', sans-serif;
            font-weight: 100;
            /* content: "\e191"; */ /* "play" icon */
            content: url(img/vadd.png);
            float: right;
            color: #F58723;
            font-size: 18px;
            line-height: 22px;
            margin-top: unset;
            /* rotate "play" icon from > (right arrow) to down arrow */
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .panel-heading [data-toggle="collapse"].collapsed:after {
            /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
            /*content: url(images/vadd.png);*/
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -ms-transform: rotate(90deg);
            -o-transform: rotate(90deg);
            transform: rotate(90deg);
            color: #454444;
        }
    </style>

    <!-- Bootstrap FAQ - END -->





    <div class="row row-white" style="padding-bottom:1%;"> </div>
    <jsp:include page="component/pop-up.jsp"></jsp:include>
    <jsp:include page="component/footer.jsp"></jsp:include>

    <jsp:include page="component/js.jsp"></jsp:include>
</body>
</html>