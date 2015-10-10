<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int minPermission = 8;
    int tab = 3;
   %>
<%@include file = "layout1.jsp"%>
<br>
<div class="form-block center-block" style="min-height: 900px;"> 
    <div id="map" style="width: 600px; height: 400px"></div><br>
    <div>
        <p style="font-size: 20px;">Добавить метку:</p>
        <input type="text" id="address1" style="width: 478px; height: 29px;" placeholder="Введите адрес">
        <button id="button1" class="btn btn-default btn-sm" style="padding: 0; margin: 0; height: 30px;">Готово</button>
    </div><br>
    <div>
        <p style="font-size: 20px;">Проложить маршрут:</p>
        <input type="text" id="address2" style="width: 237px; height: 29px;" placeholder="Введите адрес">
        <input type="text" id="address3" style="width: 237px; height: 29px;" placeholder="Введите адрес">
        <button id="button2" class="btn btn-default btn-sm" style="padding: 0; margin: 0; height: 30px;">Готово</button>
    </div><br>
    <div>
        <p style="font-size: 20px;">Узнать координаты:</p>
        <input type="text" id="address4" style="width: 478px; height: 29px;" placeholder="Введите адрес">
        <button id="button3" class="btn btn-default btn-sm" style="padding: 0; margin: 0; height: 30px;">Готово</button>
    </div><br>
    <button id="button4" class="btn btn-default btn-block">Добавить подвижные метки</button>
    <button id="button5" class="btn btn-default btn-block hidden">Проложить путь между подвижными метками</button><br>
    <table class="table" id="table">
        <thead>
            <tr>
                <th style="width: 50%;">Адрес</th>
                <th style="width: 25%;">Широта</th>
                <th style="width: 25%;">Долгота</th>
            </tr>
        </thead>
        <tbody>
    </table>
</div>

<script src="js/map.js"></script>

<%@include file = "layout2.jsp"%>
