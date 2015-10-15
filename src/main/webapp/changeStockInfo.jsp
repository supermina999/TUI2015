<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 4;
    Organization[] organization = Organization.getAll(null);
    Location[] location = Location.getAll(null);
    City[] city = City.getAll(null);
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
<%@include file = "layout1.jsp"%>

<br>
<div class="form-block center-block" style="width: 50%; min-height: 700px;">
    <center><h2 class="title">Изменить информацию о складе №<%=stock.getId()%></h2></center>
    <hr>
    <form class="form-horizontal" method = "post" action = "updateStockInfo.jsp?id=<%=Integer.parseInt(s)%>">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Город</label>
            <div class="col-sm-4">
                <select class="form-control" name="city" id="city" style="width: 100%; padding-right: 0">
                    <%for (int i = 0; i < city.length; i++) {%>
                    <option value="<%=city[i].getId()%>" <% if (stock.getLocation().getCityId() == i + 1) {%> selected <% }%>><%=city[i].getName()%></option>
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
                <input type="text" class="form-control" name="address" id="address" required value="<%=stock.getLocation().getAddress()%>">
                <i class="fa fa-map-marker form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback" id="coords">
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
                    <%for (int i = 0; i < organization.length; i++) {%>
                    <option value="<%=organization[i].getId()%>" <% if (stock.getOrganizationId() == i + 1) {%> selected <% }%>><%=organization[i].getName()%></option>
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