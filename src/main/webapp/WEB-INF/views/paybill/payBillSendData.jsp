<%@page import="java.util.Date"%>
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
       

        <!-- link to image for socio -->
        <meta property="og:url" content="-CUSTOMER VALUE-">
        <link rel="shortcut icon" href="favicon.ico">


        <!--  include the all css components -->
        <jsp:include page="../component/css.jsp"></jsp:include>
   
<script>

    window.onload = function () {
        var d = new Date().getTime();
        document.getElementById("tid").value = d;
    };
</script>


</head>
<body onload="document.forms['customerData'].submit()">


			<form method="post" name="customerData" action="payBillRequestHandler" >
			
				<input type="hidden" name="actno" value="${bill.getAccount_no() }">				
				<input type="hidden" name="trans_amount" value="${bill.getAmount() }">				
				<input type="hidden" name="trans_type" value="C">
				<input type="hidden" name="currency" value="INR">
				<input type="hidden" name="trans_descr" value="Description">
				
	        
	        
	                    
				<input readonly="readonly" type="hidden" name="tid" id="tid" value=""/><!-- Transaction ID -->
               	<input type="hidden" name="merchant_id" value="127191"/><!-- Merchant Id	: -->
			   	<input type="hidden" name="order_id" value="1236556561"/><!-- Order Id	: -->
			   	<input type="hidden" name="amount" value="${bill.getAmount() }"   />
				<input type="hidden" name="currency" value="INR"/><!-- Currency	: -->
				<input type="hidden" name="redirect_url" value="http://www.oneeight.co.in/zeno/payBillResponseHandler"/><!-- Redirect URL	: -->
				<input type="hidden" name="cancel_url" value="http://www.oneeight.co.in/zeno/ccvCancelResponse"/><!-- Cancel URL	: -->
			 	<input type="hidden" name="language" value="EN"/><!-- Language	: -->
                <input readonly="readonly" type="hidden" name="tid" id="tid" value=""/><!-- Transction ID -->
                <input type="hidden" name="merchant_id" value="127191"/><!-- Merchant ID -->
				<input type="hidden" name="order_id" value="123654789"/><!-- order id -->
				<input type="hidden" name="amount" value="${bill.getAmount() }"/><!--Amount  -->
				<input type="hidden" name="currency" value="INR"/><!-- currency -->
				<input type="hidden" name="redirect_url" value="http://www.oneeight.co.in/zeno/payBillResponseHandler"/><!-- Redirect URL -->
				<input type="hidden" name="cancel_url" value="http://www.oneeight.co.in/zeno/ccvCancelResponse"/><!-- cancel url -->
			 	<input type="hidden" name="language" value="EN"/><!-- Language -->
			 	
				<input type="hidden" name="billing_name" value="${bill.getFirst_name() }"/><!-- billing name -->
		        <input type="hidden" name="billing_address" value="${bill.getAddress() }"/><!-- billing address -->
		        <input type="hidden" name="billing_city" value="${bill.getCity() }"/><!-- billing city -->
		        <input type="hidden" name="billing_state" value="MH"/><!-- billing state -->
		        <input type="hidden" name="billing_zip" value="${bill.getPin() }"/><!-- billing zip -->
		        <input type="hidden" name="billing_country" value="India"/><!-- billing country -->
		        <input type="hidden" name="billing_tel" value="${bill.getMobile() }"/><!-- billing tel -->
		        
		        <input type="hidden" name="billing_email" value="${bill.getEmail_id() }"/><!-- billing email -->
		        <input type="hidden" name="billing_name" value="${bill.getFirst_name() }"/><!--billing name  -->
		        <input type="hidden" name="billing_address" value="${bill.getAddress() }"/><!-- billing address -->
		        <input type="hidden" name="billing_city" value="${bill.getCity() }"/><!-- billing city -->
		        <input type="hidden" name="billing_state" value="MH"/><!-- billing state -->
		        <input type="hidden" name="billing_zip" value="${bill.getPin() }"/><!-- billing zip -->
		        <input type="hidden" name="billing_country" value="India"/><!-- billing country -->
		        <input type="hidden" name="billing_tel" value="${bill.getMobile() }"/><!-- billing tel -->
		        
		        <input type="hidden" name="billing_email" value="${bill.getEmail_id() }"/><!-- billing email -->
		        <input type="hidden" name="delivery_name" value="${bill.getFirst_name() }"/><!--shiping name  -->
		        <input type="hidden" name="delivery_address" value="${bill.getAddress() }"/><!-- shiping address -->
		        <input type="hidden" name="delivery_city" value="${bill.getCity() }"/><!-- shiping city -->
		        <input type="hidden" name="delivery_state" value="Andhra"/><!-- shiping state -->
		        <input type="hidden" name="delivery_zip" value="${bill.getPin() }"/><!-- shiping zip -->
		        <input type="hidden" name="delivery_country" value="India"/><!-- shiping country -->
		        <input type="hidden" name="delivery_tel" value="${bill.getMobile() }"/><!-- shiping tel -->
		        
		        <input type="hidden" name="merchant_param1" value="additional Info."/><!-- merchant param1 -->
		        <input type="hidden" name="merchant_param2" value="additional Info."/><!-- merchant param2 -->
		        <input type="hidden" name="merchant_param3" value="additional Info."/><!-- merchant param3 -->
				<input type="hidden" name="merchant_param4" value="additional Info."/><!-- merchant param4 -->
				<input type="hidden" name="merchant_param5" value="additional Info."/><!-- merchant param5 -->
				
		        <input type="hidden" name="delivery_name" value="${bill.getFirst_name() }"/><!-- shiping name -->
		        <input type="hidden" name="delivery_address" value="${bill.getAddress() }"/><!-- shiping address -->
		        <input type="hidden" name="delivery_city" value="${bill.getCity() }"/><!-- shiping city -->
		        <input type="hidden" name="delivery_state" value="Andhra"/><!-- shiping state -->
		        <input type="hidden" name="delivery_zip" value="${bill.getPin() }"/><!-- shiping zip -->
		        <input type="hidden" name="delivery_country" value="India"/><!-- shiping country -->
		        <input type="hidden" name="delivery_tel" value="${bill.getMobile() }"/><!-- shiping tel -->
		        
		        <input type="hidden" name="merchant_param1" value="additional Info."/><!-- merchant param1 -->
		        <input type="hidden" name="merchant_param2" value="additional Info."/><!-- merchant param2 -->
		        <input type="hidden" name="merchant_param3" value="additional Info."/><!-- merchant param3 -->
				<input type="hidden" name="merchant_param4" value="additional Info."/><!-- merchant param4 -->
				<input type="hidden" name="merchant_param5" value="additional Info."/><!-- merchant param5 -->
				
						
			</form>
	      	    
	      	<!-- <script>setTimeout(function(){window.location.href='payBillRequestHandler'},3000);</script> -->      
</body>


<!-- <script language="javascript" type="text/javascript" src="json.js"></script>-->
<!-- <script src="jquery-1.7.2.min.js"></script>-->
 <script language="javascript" type="text/javascript" src="js/json.js"></script>
 <script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
  $(function(){
  
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
  	  var amount="10.00";
  	  var currency="INR";
  	  
      $.ajax({
           url:'https://secure.ccavenue.com/transaction/transaction.do?command=getJsonData&access_code='+access_code+'&currency='+currency+'&amount='+amount,
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
           error: function(xhr, textStatus, errorThrown) {
               alert('An error occurred! ' + ( errorThrown ? errorThrown :xhr.status ));
               //console.log("Error occured");
           }
   		});
   		
   		$(".payOption").click(function(){
   			var paymentOption="";
   			var cardArray="";
   			var payThrough,emiPlanTr;
		    var emiBanksArray,emiPlansArray;
   			
           	paymentOption = $(this).val();
           	$("#card_type").val(paymentOption.replace("OPT",""));
           	$("#card_name").children().remove(); // remove old card names from old one
            $("#card_name").append("<option value=''>Select</option>");
           	$("#emi_div").hide();
           	
           	//console.log(jsonData);
           	$.each(jsonData, function(index,value) {
           		//console.log(value);
            	  if(paymentOption !="OPTEMI"){
	            	 if(value.payOpt==paymentOption){
	            		cardArray = $.parseJSON(value[paymentOption]);
	                	$.each(cardArray, function() {
	    	            	$("#card_name").find("option:last").after("<option class='"+this['dataAcceptedAt']+" "+this['status']+"'  value='"+this['cardName']+"'>"+this['cardName']+"</option>");
	                	});
	                 }
	              }
	              
	              if(paymentOption =="OPTEMI"){
		              if(value.payOpt=="OPTEMI"){
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
	                	$.each(emiBanksArray, function() {
	    	            	payThrough = "<option value='"+this['planId']+"' class='"+this['BINs']+"' id='"+this['subventionPaidBy']+"' label='"+this['midProcesses']+"'>"+this['gtwName']+"</option>";
	    	            	$("#emi_banks").append(payThrough);
	                	});
	                	
	                	emiPlanTr="<tr><td>&nbsp;</td><td>EMI Plan</td><td>Monthly Installments</td><td>Total Cost</td></tr>";
							
	                	$.each(emiPlansArray, function() {
		                	emiPlanTr=emiPlanTr+
							"<tr class='tenuremonth "+this['planId']+"' id='"+this['tenureId']+"' style='display: none'>"+
								"<td> <input type='radio' name='emi_plan_radio' id='"+this['tenureMonths']+"' value='"+this['tenureId']+"' class='emi_plan_radio' > </td>"+
								"<td>"+this['tenureMonths']+ "EMIs. <label class='merchant_subvention'>@ <label class='emi_processing_fee_percent'>"+this['processingFeePercent']+"</label>&nbsp;%p.a</label>"+
								"</td>"+
								"<td>"+this['currency']+"&nbsp;"+this['emiAmount'].toFixed(2)+
								"</td>"+
								"<td><label class='currency'>"+this['currency']+"</label>&nbsp;"+ 
									"<label class='emiTotal'>"+this['total'].toFixed(2)+"</label>"+
									"<label class='emi_processing_fee_plan' style='display: none;'>"+this['emiProcessingFee'].toFixed(2)+"</label>"+
									"<label class='planId' style='display: none;'>"+this['planId']+"</label>"+
								"</td>"+
							"</tr>";
						});
						$("#emi_tbl").append(emiPlanTr);
	                 } 
                  }
           	});
           	
         });
   
	  
      $("#card_name").click(function(){
      	if($(this).find(":selected").hasClass("DOWN")){
      		alert("Selected option is currently unavailable. Select another payment option or try again later.");
      	}
      	if($(this).find(":selected").hasClass("CCAvenue")){
      		$("#data_accept").val("Y");
      	}else{
      		$("#data_accept").val("N");
      	}
      });
          
     // Emi section start      
          $("#emi_banks").live("change",function(){
	           if($(this).val() != ""){
	           		var cardsProcess="";
	           		$("#emi_tbl").show();
	           		cardsProcess=$("#emi_banks option:selected").attr("label").split("|");
					$("#card_name").children().remove();
					$("#card_name").append("<option value=''>Select</option>");
				    $.each(cardsProcess,function(index,card){
				        $("#card_name").find("option:last").after("<option class=CCAvenue value='"+card+"' >"+card+"</option>");
				    });
					$("#emi_plan_id").val($(this).val());
					$(".tenuremonth").hide();
					$("."+$(this).val()+"").show();
					$("."+$(this).val()).find("input:radio[name=emi_plan_radio]").first().attr("checked",true);
					$("."+$(this).val()).find("input:radio[name=emi_plan_radio]").first().trigger("click");
					 
					 if($("#emi_banks option:selected").attr("id")=="Customer"){
						$("#processing_fee").show();
					 }else{
						$("#processing_fee").hide();
					 }
					 
				}else{
					$("#emi_plan_id").val("");
					$("#emi_tenure_id").val("");
					$("#emi_tbl").hide();
				}
				
				
				
				$("label.emi_processing_fee_percent").each(function(){
					if($(this).text()==0){
						$(this).closest("tr").find("label.merchant_subvention").hide();
					}
				});
				
		 });
		 
		 $(".emi_plan_radio").live("click",function(){
			var processingFee="";
			$("#emi_tenure_id").val($(this).val());
			processingFee=
					"<span class='emi_fees' >"+
			 			"Processing Fee:"+$(this).closest('tr').find('label.currency').text()+"&nbsp;"+
			 			"<label id='processingFee'>"+$(this).closest('tr').find('label.emi_processing_fee_plan').text()+
			 			"</label><br/>"+
                			"Processing fee will be charged only on the first EMI."+
                	"</span>";
             $("#processing_fee").children().remove();
             $("#processing_fee").append(processingFee);
             
             // If processing fee is 0 then hiding emi_fee span
             if($("#processingFee").text()==0){
             	$(".emi_fees").hide();
             }
			  
		});
		
		
		$("#card_number").focusout(function(){
			/*
			 emi_banks(select box) option class attribute contains two fields either allcards or bin no supported by that emi 
			*/ 
			if($('input[name="payment_option"]:checked').val() == "OPTEMI"){
				if(!($("#emi_banks option:selected").hasClass("allcards"))){
				  if(!$('#emi_banks option:selected').hasClass($(this).val().substring(0,6))){
					  alert("Selected EMI is not available for entered credit card.");
				  }
			   }
		   }
		  
		});
			
			
	// Emi section end 		
	
	//dropdown value will be set depend on radio button START
	/*
   $("input[type='radio'][name='payment_option']").change(function(){
    
	var selected = $("input[type='radio'][name='payment_option']:checked").val();
    
	if(selected == "OPTCASHC") var opts = [
        {name:"Cash", val:"5,Cash"}
    ];
	
    if(selected == "OPTCRDC") var opts = [
        {name:"Credit Card", val:"8,Credit Card"}
    ];
    
    if(selected == "OPTDBCRD") var opts = [
        {name:"Debit Card", val:"9,Debit Card"}
    ];
    
    $("#instrument_detail").empty();
    
    $.each(opts, function(k,v){
        
    	$("#instrument_detail").append("<option value='"+v.val+"'>"+v.name+"</option>");
        
    });
});*/
	
 //dropdown value will be set depend on radio button START
	
	
   // below code for reference 
 
   function processData(data){
         var paymentOptions = [];
         var creditCards = [];
         var debitCards = [];
         var netBanks = [];
         var cashCards = [];
         var mobilePayments=[];
         $.each(data, function() {
         	 // this.error shows if any error   	
             console.log(this.error);
              paymentOptions.push(this.payOpt);
              switch(this.payOpt){
                case 'OPTCRDC':
                	var jsonData = this.OPTCRDC;
                 	var obj = $.parseJSON(jsonData);
                 	$.each(obj, function() {
                 		creditCards.push(this['cardName']);
                	});
                break;
                case 'OPTDBCRD':
                	var jsonData = this.OPTDBCRD;
                 	var obj = $.parseJSON(jsonData);
                 	$.each(obj, function() {
                 		debitCards.push(this['cardName']);
                	});
                break;
              	case 'OPTNBK':
	              	var jsonData = this.OPTNBK;
	                var obj = $.parseJSON(jsonData);
	                $.each(obj, function() {
	                 	netBanks.push(this['cardName']);
	                });
                break;
                
                case 'OPTCASHC':
                  var jsonData = this.OPTCASHC;
                  var obj =  $.parseJSON(jsonData);
                  $.each(obj, function() {
                  	cashCards.push(this['cardName']);
                  });
                 break;
                   
                  case 'OPTMOBP':
                  var jsonData = this.OPTMOBP;
                  var obj =  $.parseJSON(jsonData);
                  $.each(obj, function() {
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
