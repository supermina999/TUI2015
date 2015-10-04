<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<br>
<div class="form-block center-block" style="min-height: 900px;"> 
    <div>
        <p style="font-size: 20px;">Добавить метку:</p>
        <input type="text" id="address1" style="width: 500px;" placeholder="Введите адрес">
        <button id="button1">Готово</button>
    </div><br>
    <div>
        <p style="font-size: 20px;">Проложить маршрут:</p>
        <input type="text" id="address2" style="width: 250px;" placeholder="Введите адрес">
        <input type="text" id="address3" style="width: 250px;" placeholder="Введите адрес">
        <button id="button2">Готово</button>
    </div><br>
    <div>
        <p style="font-size: 20px;">Узнать координаты:</p>
        <input type="text" id="address4" style="width: 500px;" placeholder="Введите адрес">
        <button id="button3">Готово</button><br><br>
        <p>Широта: <input id="lat"></p>
        <p>Долгота: <input id="lon"></p>
    </div>
    <br><br>
    <div id="map" style="width: 600px; height: 400px"></div>
</div>

<script src="js/map.js"></script>
    
<%@include file = "layout2.jsp"%>
