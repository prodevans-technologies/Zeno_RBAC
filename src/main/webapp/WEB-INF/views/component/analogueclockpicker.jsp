<%-- 
    Document   : timepicker
    Created on : Dec 21, 2017, 12:01:19 PM
    Author     : abhinish-pda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        creating problem in the page-->
<!--        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/clockpicker.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/clockpicker.js"></script>
        
    </head>
    <body>
<!--        <div class="input-group clockpicker">
            <input type="text" class="form-control" value="09:30">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-time"></span>
            </span>
        </div>-->
        <script type="text/javascript">
       var cstart=$('#date-time-start').clockpicker({
            placement: 'top',
            align: 'left',
//            donetext: 'Done'
            autoclose: true,
            'default': 'now'
        });
       var cend = $('#date-time-end').clockpicker({
            placement: 'top',
            align: 'left',
//            donetext: 'Done'
            autoclose: true,
            'default': 'now'
        });
        $('#time_start_icon').click(function(event){
        event.stopPropagation();
        cstart.clockpicker('show');
        setInterval(function(){cstart.clockpicker('hide');}, 5000);
        console.log('clicked');
        });
        $('#time_end_icon').click(function(event2){
        event2.stopPropagation();
        cend.clockpicker('show');
        setInterval(function(){cend.clockpicker('hide');}, 5000);
        console.log('clicked');
        });
        </script>
        
        
    </body>
</html>
