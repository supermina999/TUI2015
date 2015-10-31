<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   int tab = 5;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 5) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    DBEntry[] params = {
        new DBEntry("permission_id", EntryType.Int, 4)
    };
    Person[] person = Person.getAll(params);
    Stock[] stock = Stock.getAll(null);
    Region[] region = Region.getAll(null);
    TransportType[] transport = TransportType.getAll(null);
%>
<br>
<div class="form-block center-block" style="min-height: 700px;">
    <center><h2 class="title">Добавить транспортное средство</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="addTransport.jsp">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Вид транспорта</label>
            <div class="col-sm-7">
                <select class="form-control" name="transport_type_id" style="width: 100%; padding-right: 0">
                    <option selected>Выберите вид транспорта</option>
                    <%for (int i = 0; i < transport.length; i++) {%>
                    <option value="<%=transport[i].getId()%>"><%=transport[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <div style="margin-top: 5px;">
                <a href="newTypeOfTransport.jsp?" style="font-size: 20px;"><i class="fa fa-plus"></i></a>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Номер</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="number" style="padding-right: 0" required>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Водитель</label>
            <div class="col-sm-8">
                <select class="form-control" name="driver" id="driver" style="width: 100%; padding-right: 0">
                    <option selected>Выберите водителя</option>
                    <%for (int i = 0; i < person.length; i++) {%>
                    <option value="<%=person[i].getId()%>"><%=person[i].getFullName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Склад</label>
            <div class="col-sm-8">
                <select class="form-control" name="stock_id" style="width: 100%; padding-right: 0">
                    <option selected>Выберите склад</option>
                    <%for (int i = 0; i < stock.length; i++) 
                    if (user.user.getPermissionId() == 1 || user.user.getId() == stock[i].getPersonId()) {%>
                    <option value="<%=stock[i].getId()%>">№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">
                <input class="btn btn-block btn-default" type="submit" name="submit" value="Готово">
            </div>
        </div>
    </form>
</div>
<br>
<% } %>
<%@include file = "layout2.jsp"%>