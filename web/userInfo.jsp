<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block" style="width: 50%;">
        <center><h2 class="title">Имя Фамилия Отчество</h2></center>
        <hr>
         <form class="form-horizontal">
        <div class="col-lg-5 col-sm-5">
                <div class="box-style-1 gray-bg team-member">
                    <img src="images/team-member-2.jpg" alt="">
                </div>
        </div>
            <div class="form-group col-sm-7">
                <p style="font-size: 20px;"> <b>Организация:</b> Красный крест </p>
                <p style="font-size: 20px;"> <b>Возраст:</b> 20 лет </p>
                <p style="font-size: 20px;"> <b>Город:</b> Харьков, Украина </p>
                <p style="font-size: 20px;"> <b>Телефон:</b> 123456 </p>
                <p style="font-size: 20px;"> <b>Email:</b> email@email.com </p>
                    
            </div>
            <div class="form-group"></div>
        </form>
</div>


<%@include file = "layout2.jsp"%>