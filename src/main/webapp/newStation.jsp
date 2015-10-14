<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 5;
%>
<%@include file = "layout1.jsp"%>
<%
    Organization[] organization = Organization.getAll(null);
    Location[] location = Location.getAll(null);
    City[] city = City.getAll(null);
%>
<br>
<div class="form-block center-block" style="width: 50%; min-height: 700px;">
    <center><h2 class="title">Добавить пункт выдачи</h2></center>
    <hr>
    <form class="form-horizontal" method = "post" action = "addStock.jsp">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Город</label>
            <div class="col-sm-4">
                <select class="form-control" name="city" id="city" style="width: 100%; padding-right: 0">
                    <%for (int i = 0; i < city.length; i++) {%>
                    <option value="<%=city[i].getId()%>" <%if (i == 0) {%> selected <%}%>><%=city[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="col-sm-4">
                <select class="form-control" name="type" id="type" style="width: 100%; padding-right: 0">
                    <option selected id="1">ПО АДРЕСУ</option>
                    <option>НА КАРТЕ</option>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Адрес</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="address" id="address" required>
                <i class="fa fa-map-marker form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback hidden" id="coords">
            <label class="col-sm-3 control-label">Широта</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="lat" id="lat" style="padding-right: 0">
            </div>
            <label class="col-sm-2 control-label">Долгота:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="lon" id="lon" style="padding-right: 0">
            </div>
        </div><br>
        <div id="map" style="width: 100%; height: 300px"></div><br>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Организация</label>
            <div class="col-sm-8">
                <select class="form-control" name="organization" style="width: 100%;">
                    <option>Выберите организацию</option>
                    <%for (int i = 0; i < organization.length; i++) {%>
                    <option value="<%=organization[i].getId()%>"><%=organization[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">					
                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
            </div>
        </div>
    </form>
</div>
<script src="js/base.js"></script>
<%@include file = "layout2.jsp"%>