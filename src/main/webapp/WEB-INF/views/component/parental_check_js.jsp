<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <script type="text/javascript">
    
    	/*
	    function addVoteUpClass() 
	    {
	    	jQuery(".sampleClass").css({"width":"80%", "height":"89%", "top":"40px", "color":"red"});
	    		   
	    }
    	*/
    	/*
	    var succeed = false;

	    $.ajax({
	    async: false,
	    url: "getStatus",
	    success: function() {
	         succeed = true;
	    }});
	    
	    alert(succeed);
	    */
	    
	   
	    
	    $(document).ready(function(){
	    	
		    	var	jsonData = $.ajax({
		            url: "getStatus",
		            dataType: "text",
		            async: false		            
		        });		
		    
		    	var response = jsonData["responseText"];
		    	
		    	if(response === "true")
	    		{
		    		
		    		document.getElementById("parental_control_on").style.visibility = "visible";
		    		document.getElementById("parental_control_off").style.visibility = "hidden";
//                                document.getElementById("parental-led-on").style.visibility = "visible";
//		    		document.getElementById("parental-led-off").style.visibility = "hidden";
                                document.getElementById("parental-led").src="/zeno/img/icons/led-green.png";
                                document.getElementById("parental-led").title="SURF SAFE: ON";
		    		
	    		}
		    	else
	    		{
		    		
		    		document.getElementById("parental_control_off").style.visibility = "visible";
		    		document.getElementById("parental_control_on").style.visibility = "hidden";
//                                document.getElementById("parental-led-off").style.visibility = "visible";
//		    		document.getElementById("parental-led-on").style.visibility = "hidden";
                                document.getElementById("parental-led").src="/zeno/img/icons/led-red.png";
                                document.getElementById("parental-led").title="SURF SAFE: OFF";
	    		}

	    	});
    	
	    
	    
    </script>    
    
    