<%-- 
    Document   : timedatepicker
    Created on : Dec 21, 2017, 12:44:41 AM
    Author     : abhinish-pda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/jquery.datetimepicker.min.css">
    </head>
    <body>

<!--        <input type="text" value="" id="datetimepicker"/><br><br>-->
<!--        <div class="form-group col-md-6">
            <label for="date-time-end" class="col-md-4 control-label">Start Date</label>
            <div class="input-group date  col-md-8" data-date="" >
                <input name="dates_start_date"  class="form-control form_date" id="date-start" size="16" type="text" value="" required="required" >

                <span class="input-group-addon"><span class="date_image form_date" data-date-format="dd MM yyyy" data-link-field="date-start" data-link-format="yyyy/mm/dd"></span></span>
            </div> </div>-->
    </body>

    <!--<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jquery.min.js" charset="UTF-8"></script>-->
    <!--<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>-->
    <!--<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/respond.min.js"></script>-->
<!--    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jquery.min.js" charset="UTF-8"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery.datetimepicker.full.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/respond.min.js"></script>

    <script type="text/javascript">
        var today = new Date();
        var todaydate = today.getFullYear()+'/'+(today.getMonth()+1)+'/'+today.getDate();
//        $('#date_start_icon').click(function(event){
//            event.preventDefault();
//            $('#date-start').click();
//            });
        
       
        $('#date-start').datetimepicker({
            allowInputToggle: true,
            timepicker:false,
            dayOfWeekStart: 1,
            lang: 'en',
            
            disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
           startDate: todaydate,
            format:'d.m.Y'
        });

        $('#date-end').datetimepicker({
            timepicker:false,
            dayOfWeekStart: 1,
            lang: 'en',
            
            disabledDates: ['1986/01/08', '1986/01/09', '1986/01/10'],
          startDate: todaydate,
            format:'d.m.Y'
        });
        
        //codes for images link
        
        $('#date_start_icon').click(function(event){
        event.preventDefault();
        $('#date-start').focus();
        console.log('clicked');
        });
        $('#date_end_icon').click(function(event){
        event.preventDefault();
        $('#date-end').focus();
        console.log('clicked');
        });

    </script>     
</html>
