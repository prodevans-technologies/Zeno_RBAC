<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
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
        <meta content="author" name="ONE8">

        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">


        <!--  include the all css components -->
        <jsp:include page="../component/css.jsp"></jsp:include>

            <script type="text/javascript">




                /*$("input:radio").click(function() {
     
                 var k = $(this).val();
     
                 $('#dropdownid').val("dropdownvalue");
                 });
                 */
            </script>

            <style type="text/css">

                .col-xs-12,.col-md-7, .col-md-6, .col-sm-6  
                {
                    padding-left: 1px !important;
                    padding-right: 1px !important;
                }

                


                #floating-button
                {
                    background: #9cafad !important;
                }

                .mainBlock31
                {
                    width :96%;
                    height: 300px;
                    color:black !important;
                    margin: 5%;
                    margin-left:2%;
                    padding: 2% 4%;
                    margin-bottom: 8%;
                    margin-top:8%;
                    -webkit-box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
                    -moz-box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
                    box-shadow: 2px 4px 8px 0px rgba(127,140,141,1);
                }

                .firstRow
                {
                    background-image: url('img/blue_small.png');
                    padding-left: 5% !important;
                    min-height: 116px;
                    background-size: cover;
                }
                input[type=radio].css-checkbox
                {
                    position:absolute;
                    z-index:-1000;
                    left:-1000px;
                    overflow: hidden;
                    clip: rect(0 0 0 0);
                    height:1px; width:1px;
                    margin:-1px;
                    padding:0;
                    border:0;
                }

                input[type=radio].css-checkbox + label.css-label 
                {
                    padding-left:30px;
                    height:25px; 
                    display:inline-block;
                    line-height:25px;
                    background-repeat:no-repeat;
                    background-position: 0 0;

                    vertical-align:middle;
                    cursor:pointer;
                }

                input[type=radio].css-checkbox:checked + label.css-label 
                {
                    background-position: 0 -25px;
                }

                label.css-label
                {
                    background-image:url(http://csscheckbox.com/checkboxes/u/csscheckbox_98809849d4d88f570f5ad4ce6c2be5b1.png);
                    -webkit-touch-callout: none;
                    -webkit-user-select: none;
                    -khtml-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    user-select: none;
                }

				@media ( max-width : 767px) 
                {
                    .mainBlock31
                    {
                        width: 95% !important;
                        min-height: 615px !important;
                        margin-bottom: 2% !important;
                    }
                }
                @media (max-width:991px) and (min-width:768px)
                {	
                    .col-xs-12,.col-md-7  
                    {
                        padding-left: 1px !important;
                    }
                    .mainBlock31
                    {
                        width: 95% !important;
                        min-height: 540px !important;
                    }  	
                }
                @media ( max-width :1366px ) and (min-width:992px)
                {
                    .mainBlock31
                    {
                        width: 94% !important;
                        height: 275px !important;
                        margin-top: 7% !important;
                        margin-bottom: 7% !important;
                    }
                }
                
            </style>

            <script>

                window.onload = function () {
                    var d = new Date().getTime();
                    document.getElementById("tid").value = d;
                };
            </script>


        </head>
        <body class="corporate">

            <!--  include menubar -->
        <jsp:include page="../component/menubar.jsp"></jsp:include>	

        <jsp:include page="../component/pop-up.jsp"></jsp:include>


            <div class="col-md-4 col-sm-12  firstRow pt-20">
                <h1 style="color: white; ">Top Up</h1>
            </div>

            <div class="col-md-8 col-sm-12 pt-20 pt-20M" style="background-color: #ecf0f1;min-height: 116px;">
            </div>            
            <!-- END STEPS -->

		<%! 
			String order_id="";
			String year="";
			String month="";
			String date="";
			String hr="";
			String minute="";
		%>
		
		<%
		LocalDateTime localDate = LocalDateTime.now();
		year=""+localDate.getYear();
		year=year.substring(2,4);
		month=""+localDate.getMonthValue();
		date=""+localDate.getDayOfMonth();
		hr=""+localDate.getHour();
		minute=""+localDate.getMinute();
		
		order_id=request.getAttribute("act_id")+year+""+month+""+date+""+hr+""+minute;
		//out.print("<h1>"+order_id+"</h1>");
		
		%>



	<form method="post" name="customerData" action="ccvTopUpRequestHandler">


            <input type="hidden" name="actno" value="${user_details.getActno() }">				
            <input type="hidden" name="trans_amount" value="${topUp.getAmount() }">

            <input type="hidden" name="planSize" value="${topUp.getPlanSize() }">
            <input type="hidden" name="planName" value="${topUp.getPlanName() }">
            <input type="hidden" name="postFUP" value="${topUp.getPostFUP() }">

            <input type="hidden" name="trans_type" value="C">
            <input type="hidden" name="currency" value="INR">
            <input type="hidden" name="trans_descr" value="Description">



            <div class="col-md-4">
            </div> 
            <div class="col-md-7 col-xs-12">
                <div class="mainBlock31" style="color:black;">

                    <div class="col-md-5 col-xs-12">
                        <h3 class="pb-20">Details</h3>

                        <div class="col-md-4 col-xs-4">
                            <h4 class="pb-10">Name :</h4>
                        </div>
                        <div class="col-md-8 col-xs-8">
                            <h4 class="pb-10">${user_details.getFirst_name() } ${user_details.getLast_name() }</h4>
                        </div>					


                        <div class="col-md-4 col-xs-4">
                            <h4 class="pb-10">Amount</h4>
                        </div>
                        <div class="col-md-8 col-xs-8">
                            <h4 class="pb-10">&#8377; ${topUp.getAmount() }/-</h4>
                        </div>					
                        <div class="col-md-4 col-xs-4">
                            <h4 class="pb-10">Email :</h4>
                        </div>
                        <div class="col-md-8 col-xs-8">
                            <h4 class="pb-10">${user_details.getEmail() }</h4>
                        </div>					
                        <div class="col-md-4 col-xs-4">
                            <h4 class="pb-10">Mobile :</h4>
                        </div>
                        <div class="col-md-8 col-xs-8">
                            <h4 class="pb-10">${user_details.getMobileno() }</h4>
                        </div>				
                        <select class="form-control" name="instrument_detail" id="instrument_detail" style="visibility: hidden;">
                        </select>
                    </div><!-- col-md-5 -->
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-6 col-sm-7">

                        <div class="col-md-12 col-sm-12">
                            <div class="row">
                                <div class="col-md-6 col-xs-6">
                                    <h4 class="pb-10" style="font-size: 14px;">Plan Size: <strong>${topUp.getPlanSize() }</strong></h4>
                                </div>
                                <div class="col-md-6 col-xs-6">
                                    <h4 class="pb-10" style="font-size: 14px;">Plan Name: <strong>${topUp.getPlanName() }</strong></h4>
                                </div>
                            </div>
                            <div class="row">
                                <h3 class="pb-10" style="padding-left:5px;">Payment Option</h3>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <input type="radio" name="payment_option" value="OPTCRDC" id="radio1" class="css-checkbox" />
                                    <label for="radio1" class="css-label radGroup1">Credit Card</label><br>
                                    <div class="pb-10"></div>

                                    <input type="radio" name="payment_option" value="OPTDBCRD" id="radio2" class="css-checkbox" />
                                    <label for="radio2" class="css-label radGroup1">Debit Card</label><br>
                                    <div class="pb-10"></div>

                                    <input type="radio" name="payment_option" value="OPTNBK" id="radio3" class="css-checkbox" />
                                    <label for="radio3" class="css-label radGroup1">Net Banking</label><br>
                                    <div class="pb-10"></div>

                                </div>

                                <div class="col-md-6 col-sm-6">
                                    <input type="radio" name="payment_option" value="OPTMOBP" id="radio5" class="css-checkbox" />
                                    <label for="radio5" class="css-label radGroup1">Mobile Payments</label><br>
                                    <div class="pb-10"></div>

                                    <input type="radio" name="payment_option" value="OPTWLT" id="radio7" class="css-checkbox" />
                                    <label for="radio7" class="css-label radGroup1">Wallet</label><br>
                                    <div class="pb-10"></div>

                                </div>
                            </div>											
                        </div>

                        <div class="col-md-12" style="margin-bottom: 2%; text-align: right;">
                            <button class="btn billButton" type="submit">CONFIRM PAYMENT</button>
                        </div> 	
                    </div>   
                </div>	 

            </div>


            <input readonly="readonly" type="hidden" name="tid" id="tid" value=""/><!-- Transaction ID -->
            <input type="hidden" name="merchant_id" value="127191"/><!-- Merchant Id	: -->
            <input type="hidden" name="order_id" value="<%=order_id%>"/><!-- Order Id	: -->
            <input type="hidden" name="amount" value="${topUp.getAmount() }"   />
            <input type="hidden" name="currency" value="INR"/><!-- Currency	: -->
            <input type="hidden" name="redirect_url" value="http://www.oneeight.co.in/zeno/ccvTopUpResponseHandler"/><!-- Redirect URL	: -->
            <input type="hidden" name="cancel_url" value="http://www.oneeight.co.in/zeno/ccvCancelResponse"/><!-- Cancel URL	: -->
            <input type="hidden" name="language" value="EN"/><!-- Language	: -->
            <input readonly="readonly" type="hidden" name="tid" id="tid" value=""/><!-- Transction ID -->
            <input type="hidden" name="merchant_id" value="127191"/><!-- Merchant ID -->
            <input type="hidden" name="order_id" value="<%=order_id%>"/><!-- order id -->
            <input type="hidden" name="amount" value="${topUp.getAmount() }"/><!--Amount  -->
            <input type="hidden" name="currency" value="INR"/><!-- currency -->
            <input type="hidden" name="redirect_url" value="http://www.oneeight.co.in/zeno/ccvTopUpResponseHandler"/><!-- Redirect URL -->
            <input type="hidden" name="cancel_url" value="http://www.oneeight.co.in/zeno/ccvCancelResponse"/><!-- cancel url -->
            <input type="hidden" name="language" value="EN"/><!-- Language -->

            <input type="hidden" name="billing_name" value="${user_details.getFirst_name() }"/><!-- billing name -->
            <input type="hidden" name="billing_address" value="${user_details.getAddress() }"/><!-- billing address -->
            <input type="hidden" name="billing_city" value="${user_details.getCityname() }"/><!-- billing city -->
            <input type="hidden" name="billing_state" value="MH"/><!-- billing state -->
            <input type="hidden" name="billing_zip" value="${user_details.getPin() }"/><!-- billing zip -->
            <input type="hidden" name="billing_country" value="India"/><!-- billing country -->
            <input type="hidden" name="billing_tel" value="${user_details.getMobileno() }"/><!-- billing tel -->

            <input type="hidden" name="billing_email" value="${user_details.getEmail() }"/><!-- billing email -->
            <input type="hidden" name="billing_name" value="${user_details.getFirst_name() }"/><!--billing name  -->
            <input type="hidden" name="billing_address" value="${user_details.getAddress() }"/><!-- billing address -->
            <input type="hidden" name="billing_city" value="${user_details.getCityname() }"/><!-- billing city -->
            <input type="hidden" name="billing_state" value="MH"/><!-- billing state -->
            <input type="hidden" name="billing_zip" value="${user_details.getPin() }"/><!-- billing zip -->
            <input type="hidden" name="billing_country" value="India"/><!-- billing country -->
            <input type="hidden" name="billing_tel" value="${user_details.getMobileno() }"/><!-- billing tel -->

            <input type="hidden" name="billing_email" value="${user_details.getEmail() }"/><!-- billing email -->
            <input type="hidden" name="delivery_name" value="${user_details.getFirst_name() }"/><!--shiping name  -->
            <input type="hidden" name="delivery_address" value="${user_details.getAddress() }"/><!-- shiping address -->
            <input type="hidden" name="delivery_city" value="${user_details.getCityname() }"/><!-- shiping city -->
            <input type="hidden" name="delivery_state" value="Andhra"/><!-- shiping state -->
            <input type="hidden" name="delivery_zip" value="${user_details.getPin() }"/><!-- shiping zip -->
            <input type="hidden" name="delivery_country" value="India"/><!-- shiping country -->
            <input type="hidden" name="delivery_tel" value="${user_details.getMobileno() }"/><!-- shiping tel -->

            <input type="hidden" name="merchant_param1" value="additional Info."/><!-- merchant param1 -->
            <input type="hidden" name="merchant_param2" value="additional Info."/><!-- merchant param2 -->
            <input type="hidden" name="merchant_param3" value="additional Info."/><!-- merchant param3 -->
            <input type="hidden" name="merchant_param4" value="additional Info."/><!-- merchant param4 -->
            <input type="hidden" name="merchant_param5" value="additional Info."/><!-- merchant param5 -->

            <input type="hidden" name="delivery_name" value="${user_details.getFirst_name() }"/><!-- shiping name -->
            <input type="hidden" name="delivery_address" value="${user_details.getAddress() }"/><!-- shiping address -->
            <input type="hidden" name="delivery_city" value="${user_details.getCityname() }"/><!-- shiping city -->
            <input type="hidden" name="delivery_state" value="Andhra"/><!-- shiping state -->
            <input type="hidden" name="delivery_zip" value="${user_details.getPin() }"/><!-- shiping zip -->
            <input type="hidden" name="delivery_country" value="India"/><!-- shiping country -->
            <input type="hidden" name="delivery_tel" value="${user_details.getMobileno() }"/><!-- shiping tel -->

            <input type="hidden" name="merchant_param1" value="additional Info."/><!-- merchant param1 -->
            <input type="hidden" name="merchant_param2" value="additional Info."/><!-- merchant param2 -->
            <input type="hidden" name="merchant_param3" value="additional Info."/><!-- merchant param3 -->
            <input type="hidden" name="merchant_param4" value="additional Info."/><!-- merchant param4 -->
            <input type="hidden" name="merchant_param5" value="additional Info."/><!-- merchant param5 -->




            <!-- EMI section start -->



            <input readonly="readonly" type="hidden" id="emi_plan_id"  name="emi_plan_id" value=""/>
            <input readonly="readonly" type="hidden" id="emi_tenure_id" name="emi_tenure_id" value=""/>
            <input readonly="readonly" type="hidden" id="emi_plan_id"  name="emi_plan_id" value=""/>
            <input readonly="readonly" type="hidden" id="emi_tenure_id" name="emi_tenure_id" value=""/>
            <select name="emi_banks"  id="emi_banks" style="visibility: hidden;">
            </select>

            <div id="emi_duration" class="span12">



                <input type="hidden" id="card_type" name="card_type" value="" readonly="readonly"/><!-- card type -->
                <select name="card_name" id="card_name" style="visibility: hidden;">
                </select> 

                <input type="hidden" id="data_accept" name="data_accept" readonly="readonly"/><!-- Data accept -->

                <input type="hidden" id="card_number" name="card_number" value=""/><!-- card number -->

                <input type="hidden" name="expiry_month" value=""/><!-- expiry month -->

                <input type="hidden" name="expiry_year" value=""/><!--  -->
                <input type="hidden" name="cvv_number" value=""/><!-- cvv number -->

                <input type="hidden" name="issuing_bank" value=""/><!-- issueing bank -->
                <input type="hidden" name="mobile_number" value=""/><!-- mobile number -->
                <input type="hidden" name="mm_id" value=""/><!-- mm_id -->
                <input type="hidden" name="otp" value=""/><!-- otp -->
                <input type="hidden" id="data_accept" name="data_accept" readonly="readonly"/><!-- data accept -->
                <input type="hidden" id="card_number" name="card_number" value=""/><!-- card number -->
                <input type="hidden" name="expiry_month" value=""/><!-- expry month -->
                <input type="hidden" name="expiry_year" value=""/><!-- expiry year -->
                <input type="hidden" name="cvv_number" value=""/><!-- cvv number -->
                <input type="hidden" name="issuing_bank" value=""/><!-- issuing bank -->
                <input type="hidden" name="mobile_number" value=""/><!--mobile no  -->
                <input type="hidden" name="mm_id" value=""/><!-- mmid -->
                <input type="hidden" name="otp" value=""/><!-- otp -->
                <input name="promo_code" id="promo_code" type="hidden" /> 

            </div>

        </form>		    


        <jsp:include page="../component/footer.jsp"></jsp:include>

        <jsp:include page="../component/pop-up.jsp"></jsp:include>

            <!-- Load javascripts at bottom, this will reduce page load time -->
        <jsp:include page="../component/js.jsp"></jsp:include>   




    </body>
    <!-- <script language="javascript" type="text/javascript" src="json.js"></script>-->
    <!-- <script src="jquery-1.7.2.min.js"></script>-->
    <script language="javascript" type="text/javascript" src="js/json.js"></script>
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {

            /* json object contains
             1) payOptType - Will contain payment options allocated to the merchant. Options may include Credit Card, Net Banking, Debit Card, Cash Cards or Mobile Payments.
             2) cardType - Will contain card type allocated to the merchant. Options may include Credit Card, Net Banking, Debit Card, Cash Cards or Mobile Payments.
             3) cardName - Will contain name of card. E.g. Visa, MasterCard, American Express or and bank name in case of Net banking. 
             4) status - Will help in identifying the status of the payment mode. Options may include Active or Down.
             5) dataAcceptedAt - It tell data accept at CCAvenue or Service provider
             6)error -  This parameter will enable you to troubleshoot any configuration related issues. It will provide error description.
             */
            var jsonData;
            var access_code = "" // shared by CCAVENUE 
            var amount = "10.00";
            var currency = "INR";

            $.ajax({
                url: 'https://secure.ccavenue.com/transaction/transaction.do?command=getJsonData&access_code=' + access_code + '&currency=' + currency + '&amount=' + amount,
                dataType: 'jsonp',
                jsonp: false,
                jsonpCallback: 'processData',
                success: function (data) {
                    jsonData = data;
                    // processData method for reference
                    processData(data);
                    // get Promotion details
                    $.each(jsonData, function (index, value) {
                        if (value.Promotions != undefined && value.Promotions != null) {
                            var promotionsArray = $.parseJSON(value.Promotions);
                            $.each(promotionsArray, function () {
                                console.log(this['promoId'] + " " + this['promoCardName']);
                                var promotions = "<option value=" + this['promoId'] + ">"
                                        + this['promoName'] + " - " + this['promoPayOptTypeDesc'] + "-" + this['promoCardName'] + " - " + currency + " " + this['discountValue'] + "  " +
                                        this['promoType'] + "</option>";
                                $("#promo_code").find("option:last").after(promotions);
                            });
                        }
                    });
                },
                error: function (xhr, textStatus, errorThrown) {
                    alert('An error occurred! ' + (errorThrown ? errorThrown : xhr.status));
                    //console.log("Error occured");
                }
            });

            $(".payOption").click(function () {
                var paymentOption = "";
                var cardArray = "";
                var payThrough, emiPlanTr;
                var emiBanksArray, emiPlansArray;

                paymentOption = $(this).val();
                $("#card_type").val(paymentOption.replace("OPT", ""));
                $("#card_name").children().remove(); // remove old card names from old one
                $("#card_name").append("<option value=''>Select</option>");
                $("#emi_div").hide();

                //console.log(jsonData);
                $.each(jsonData, function (index, value) {
                    //console.log(value);
                    if (paymentOption != "OPTEMI") {
                        if (value.payOpt == paymentOption) {
                            cardArray = $.parseJSON(value[paymentOption]);
                            $.each(cardArray, function () {
                                $("#card_name").find("option:last").after("<option class='" + this['dataAcceptedAt'] + " " + this['status'] + "'  value='" + this['cardName'] + "'>" + this['cardName'] + "</option>");
                            });
                        }
                    }

                    if (paymentOption == "OPTEMI") {
                        if (value.payOpt == "OPTEMI") {
                            $("#emi_div").show();
                            $("#card_type").val("CRDC");
                            $("#data_accept").val("Y");
                            $("#emi_plan_id").val("");
                            $("#emi_tenure_id").val("");
                            $("span.emi_fees").hide();
                            $("#emi_banks").children().remove();
                            $("#emi_banks").append("<option value=''>Select your Bank</option>");
                            $("#emi_tbl").children().remove();

                            emiBanksArray = $.parseJSON(value.EmiBanks);
                            emiPlansArray = $.parseJSON(value.EmiPlans);
                            $.each(emiBanksArray, function () {
                                payThrough = "<option value='" + this['planId'] + "' class='" + this['BINs'] + "' id='" + this['subventionPaidBy'] + "' label='" + this['midProcesses'] + "'>" + this['gtwName'] + "</option>";
                                $("#emi_banks").append(payThrough);
                            });

                            emiPlanTr = "<tr><td>&nbsp;</td><td>EMI Plan</td><td>Monthly Installments</td><td>Total Cost</td></tr>";

                            $.each(emiPlansArray, function () {
                                emiPlanTr = emiPlanTr +
                                        "<tr class='tenuremonth " + this['planId'] + "' id='" + this['tenureId'] + "' style='display: none'>" +
                                        "<td> <input type='radio' name='emi_plan_radio' id='" + this['tenureMonths'] + "' value='" + this['tenureId'] + "' class='emi_plan_radio' > </td>" +
                                        "<td>" + this['tenureMonths'] + "EMIs. <label class='merchant_subvention'>@ <label class='emi_processing_fee_percent'>" + this['processingFeePercent'] + "</label>&nbsp;%p.a</label>" +
                                        "</td>" +
                                        "<td>" + this['currency'] + "&nbsp;" + this['emiAmount'].toFixed(2) +
                                        "</td>" +
                                        "<td><label class='currency'>" + this['currency'] + "</label>&nbsp;" +
                                        "<label class='emiTotal'>" + this['total'].toFixed(2) + "</label>" +
                                        "<label class='emi_processing_fee_plan' style='display: none;'>" + this['emiProcessingFee'].toFixed(2) + "</label>" +
                                        "<label class='planId' style='display: none;'>" + this['planId'] + "</label>" +
                                        "</td>" +
                                        "</tr>";
                            });
                            $("#emi_tbl").append(emiPlanTr);
                        }
                    }
                });

            });


            $("#card_name").click(function () {
                if ($(this).find(":selected").hasClass("DOWN")) {
                    alert("Selected option is currently unavailable. Select another payment option or try again later.");
                }
                if ($(this).find(":selected").hasClass("CCAvenue")) {
                    $("#data_accept").val("Y");
                } else {
                    $("#data_accept").val("N");
                }
            });

            // Emi section start      
            $("#emi_banks").live("change", function () {
                if ($(this).val() != "") {
                    var cardsProcess = "";
                    $("#emi_tbl").show();
                    cardsProcess = $("#emi_banks option:selected").attr("label").split("|");
                    $("#card_name").children().remove();
                    $("#card_name").append("<option value=''>Select</option>");
                    $.each(cardsProcess, function (index, card) {
                        $("#card_name").find("option:last").after("<option class=CCAvenue value='" + card + "' >" + card + "</option>");
                    });
                    $("#emi_plan_id").val($(this).val());
                    $(".tenuremonth").hide();
                    $("." + $(this).val() + "").show();
                    $("." + $(this).val()).find("input:radio[name=emi_plan_radio]").first().attr("checked", true);
                    $("." + $(this).val()).find("input:radio[name=emi_plan_radio]").first().trigger("click");

                    if ($("#emi_banks option:selected").attr("id") == "Customer") {
                        $("#processing_fee").show();
                    } else {
                        $("#processing_fee").hide();
                    }

                } else {
                    $("#emi_plan_id").val("");
                    $("#emi_tenure_id").val("");
                    $("#emi_tbl").hide();
                }



                $("label.emi_processing_fee_percent").each(function () {
                    if ($(this).text() == 0) {
                        $(this).closest("tr").find("label.merchant_subvention").hide();
                    }
                });

            });

            $(".emi_plan_radio").live("click", function () {
                var processingFee = "";
                $("#emi_tenure_id").val($(this).val());
                processingFee =
                        "<span class='emi_fees' >" +
                        "Processing Fee:" + $(this).closest('tr').find('label.currency').text() + "&nbsp;" +
                        "<label id='processingFee'>" + $(this).closest('tr').find('label.emi_processing_fee_plan').text() +
                        "</label><br/>" +
                        "Processing fee will be charged only on the first EMI." +
                        "</span>";
                $("#processing_fee").children().remove();
                $("#processing_fee").append(processingFee);

                // If processing fee is 0 then hiding emi_fee span
                if ($("#processingFee").text() == 0) {
                    $(".emi_fees").hide();
                }

            });


            $("#card_number").focusout(function () {
                /*
                 emi_banks(select box) option class attribute contains two fields either allcards or bin no supported by that emi 
                 */
                if ($('input[name="payment_option"]:checked').val() == "OPTEMI") {
                    if (!($("#emi_banks option:selected").hasClass("allcards"))) {
                        if (!$('#emi_banks option:selected').hasClass($(this).val().substring(0, 6))) {
                            alert("Selected EMI is not available for entered credit card.");
                        }
                    }
                }

            });


            // Emi section end 		

            //dropdown value will be set depend on radio button START

            $("input[type='radio'][name='payment_option']").change(function () {

                var selected = $("input[type='radio'][name='payment_option']:checked").val();

                if (selected == "OPTCASHC")
                    var opts = [
                        {name: "Cash", val: "5,Cash"}
                    ];

                if (selected == "OPTCRDC")
                    var opts = [
                        {name: "Credit Card", val: "8,Credit Card"}
                    ];

                if (selected == "OPTDBCRD")
                    var opts = [
                        {name: "Debit Card", val: "9,Debit Card"}
                    ];

                $("#instrument_detail").empty();

                $.each(opts, function (k, v) {

                    $("#instrument_detail").append("<option value='" + v.val + "'>" + v.name + "</option>");

                });
            });
            //dropdown value will be set depend on radio button START


            // below code for reference 

            function processData(data) {
                var paymentOptions = [];
                var creditCards = [];
                var debitCards = [];
                var netBanks = [];
                var cashCards = [];
                var mobilePayments = [];
                $.each(data, function () {
                    // this.error shows if any error   	
                    console.log(this.error);
                    paymentOptions.push(this.payOpt);
                    switch (this.payOpt) {
                        case 'OPTCRDC':
                            var jsonData = this.OPTCRDC;
                            var obj = $.parseJSON(jsonData);
                            $.each(obj, function () {
                                creditCards.push(this['cardName']);
                            });
                            break;
                        case 'OPTDBCRD':
                            var jsonData = this.OPTDBCRD;
                            var obj = $.parseJSON(jsonData);
                            $.each(obj, function () {
                                debitCards.push(this['cardName']);
                            });
                            break;
                        case 'OPTNBK':
                            var jsonData = this.OPTNBK;
                            var obj = $.parseJSON(jsonData);
                            $.each(obj, function () {
                                netBanks.push(this['cardName']);
                            });
                            break;

                        case 'OPTCASHC':
                            var jsonData = this.OPTCASHC;
                            var obj = $.parseJSON(jsonData);
                            $.each(obj, function () {
                                cashCards.push(this['cardName']);
                            });
                            break;

                        case 'OPTMOBP':
                            var jsonData = this.OPTMOBP;
                            var obj = $.parseJSON(jsonData);
                            $.each(obj, function () {
                                mobilePayments.push(this['cardName']);
                            });
                    }

                });

                //console.log(creditCards);
                // console.log(debitCards);
                // console.log(netBanks);
                // console.log(cashCards);
                //  console.log(mobilePayments);

            }
        });
    </script>
</html>
