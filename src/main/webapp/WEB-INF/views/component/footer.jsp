<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

    .pdlFooter
    {
        padding-left: 0.1%;
    }
    .footerPR
    {
        padding-right: 0.1%;
    }
    @media ( max-width :1366px ) and (min-width:1024px)
    {
        .pdlFooter
        {
            padding-left: unset;		
        }
        .footerPR
        {
            padding-right: 1.2%;
        }
    }
    @media ( max-width :500px ) and (min-width:240px){
        

        .footer > .row
        {
            text-align: center;
        }
        .footerPR > .row
        {
            text-align: center;
        }
    }




</style>

<!-- BEGIN FOOTER -->
<div class="footer"  style="width:100%;  font-size:10px">

    <div class="row" style="margin:unset;margin-left: 5%; margin-right: 4%;">
        <!-- BEGIN COPYRIGHT -->

        <div class="col-md-3 col-xs-12 pdlFooter" style="color:black; "><div class="font-h5"> &copy; <script type="text/JavaScript">document.write(new Date().getFullYear());</script> ONE-EIGHT TECHNOLOGIES PRIVATE LTD</div></div> 
        <div class="col-md-9 col-xs-12 footerPR" style="text-align: right;">
            <div class="row">
                <a href="${pageContext.request.contextPath }/help" class="font-h5">FAQ </a> <span style="padding: 5px;"></span>
               
                <a href="${pageContext.request.contextPath }/terms" class="font-h5">TERMS AND CONDITIONS </a> <span style="padding: 5px;"></span>
                
                <a href="${pageContext.request.contextPath }/privacy" class="font-h5">PRIVACY POLICY </a> <span style="padding: 5px;"></span>
                
                <a href="${pageContext.request.contextPath }/refund" class="font-h5">REFUND AND CANCELLATION </a> <span style="padding: 5px;"></span>
                
                <a href="${pageContext.request.contextPath }/knowYourCPE" class="font-h5">KNOW YOUR ONE8 CUBE </a> <span style="padding: 5px;"></span>
               <!--  
                <a href="${pageContext.request.contextPath }/knowYourBill" class="font-h5" target="_blank">KNOW YOUR BILL</a> <span style="padding: 5px;"></span>
 -->
                <a href="${pageContext.request.contextPath }/contactusPage" class="font-h5">CONTACT US </a>  <span style="padding: 5px;"></span>
                
                <a href="${pageContext.request.contextPath }/feedbackPage" class="font-h5">FEEDBACK </a> 
                
                
            </div>
        </div>
    </div>
    <!-- END COPYRIGHT -->
</div>


<!-- END FOOTER -->  




