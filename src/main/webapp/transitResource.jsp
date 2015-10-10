<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 3;
   %>
<%@include file = "layout1.jsp"%>
<%
    DBModel.init();
    City[] city = City.getAll(null);
    Station[] station = Station.getAll(null);
    Stock[] stock = Stock.getAll(null);
    AvailableResource[] availableRes = AvailableResource.getAll(null);
%>
<br>
<div class="form-block center-block" style="min-height: 700px;">
    <center><h2 class="title">Перевезти ресурс</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="doTransitResource.jsp">
        <div class="form-group">
            <label class="col-sm-3 control-label">Наименование</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="resourceId">
                    <option>Выберите наименование</option>
                    <%for (int i = 0; i < availableRes.length; i++) {%>
                    <option value="<%=availableRes[i].getResourceId()%>"><%=availableRes[i].getResourceName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Количество</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="number">
            </div>
        </div>
        <center><h3 class="title">Место отправления:</h3></center>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Город</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="cityOut">
                    <option>Выберите город</option>
                    <%for (int i = 0; i < city.length; i++) {%>
                    <option><%=city[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Склад</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="stockId">
                    <option>Выберите склад</option>
                    <%for (int i = 0; i < stock.length; i++) {%>
                    <option value="<%=stock[i].getId()%>"><%=stock[i].getLocation().getAddress()%></option>
                    <%}%>
                </select>
            </div>
        </div>

        <center><h3 class="title">Место получения:</h3></center>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Город</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="cityIn">
                    <option>Выберите город</option>
                    <%for (int i = 0; i < city.length; i++) {%>
                    <option><%=city[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Пункт выдачи</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="stationId">
                    <option>Выберите пункт выдачи</option>
                    <%for (int i = 0; i < station.length; i++) {%>
                    <option  value="<%=station[i].getId()%>"><%=station[i].getLocation().getAddress()%></option>
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


<%@include file = "layout2.jsp"%>