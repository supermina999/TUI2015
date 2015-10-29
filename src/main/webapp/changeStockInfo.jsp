<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int tab = 4;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 5 && user.user.getPermissionId() != 3) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    Location[] location = Location.getAll(null);
    Region[] region = Region.getAll(null);
    DBEntry[] params = {
        new DBEntry("permission_id", EntryType.Int, 5)
    };
    Person[] person = Person.getAll(params);
    String s = request.getParameter("id");
    Stock stock = new Stock();
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%} else {
        int i = Integer.parseInt(s);
        stock = Stock.getOne(i);
    }
%>

<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<br>
<div class="form-block center-block" style="width: 50%; min-height: 700px;">
    <center><h2 class="title">Изменить информацию о складе №<%=stock.getId()%></h2></center>
    <hr>
    <form class="form-horizontal" method = "post" action = "updateStockInfo.jsp?id=<%=Integer.parseInt(s)%>">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Заведующий</label>
            <div class="col-sm-8">
                <select class="form-control" name="person" id="person" style="width: 100%; padding-right: 0">
                    <option selected>Выберите заведующего</option>
                    <%for (int i = 0; i < person.length; i++) {%>
                    <option value="<%=person[i].getId()%>"><%=person[i].getFullName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Область</label>
            <div class="col-sm-4">
                <select class="form-control" name="region" id="region" style="width: 105%; padding-right: 0">
                    <%for (int i = 0; i < region.length; i++) {%>
                    <option value="<%=region[i].getId()%>" <% if (stock.getLocation().getRegionId() == i + 1) {%> selected <% }%>><%=region[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="col-sm-4">
                <select class="form-control" name="type" id="type" style="width: 100%; padding-right: 0">
                    <option selected id="1">По адресу</option>
                    <option>На карте</option>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Адрес</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="address" id="address" required value="<%=stock.getLocation().getAddress()%>">
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
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">					
                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
            </div>
        </div>
    </form>
</div>
<br>
<% } %>
<script src="js/stock.js"></script>
<%@include file = "layout2.jsp"%>