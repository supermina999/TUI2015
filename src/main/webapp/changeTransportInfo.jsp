<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 3;
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
    String s = request.getParameter("id");
    DBEntry[] params = {
        new DBEntry("permission_id", EntryType.Int, 4)
    };
    Person[] person = Person.getAll(params);
    Stock[] stock = Stock.getAll(null);
    Region[] region = Region.getAll(null);
    TransportType[] transportType = TransportType.getAll(null);
    Transport transport = new Transport();
    int id = -1;
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%} else {
        id = Integer.parseInt(s);
        transport = Transport.getOne(id);
        if (Stock.getOne(transport.getStockId()).getPersonId() != user.user.getId() && user.user.getPermissionId() != 1) {%>
             <%@include file = "wrongPermission.jsp"%>
        <%} else {
%>

<br>
<div class="form-block center-block" style="min-height: 1200px;">
    <center><h2 class="title">Изменить информацию о транспортном средстве</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="updateTransportInfo.jsp?id=<%=id%>&transport_type_id=<%=transport.getTypeId()%>">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Вид транспорта</label>
            <div class="col-sm-8">
                <p style="margin: 0; margin-top: 7px;"><%=transport.getName()%></p>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Номер</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="number" style="padding-right: 0" required value="<%=transport.getNumber()%>">
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Водитель</label>
            <div class="col-sm-8">
                <select class="form-control" name="driver" id="driver" style="width: 100%; padding-right: 0">
                    <%for (int i = 0; i < person.length; i++) {%>
                    <option value="<%=person[i].getId()%>" <% if (transport.getPersonId() == person[i].getId()) {%> selected <% }%>><%=person[i].getFullName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Склад</label>
            <div class="col-sm-8">
                <select class="form-control" name="stock_id" style="width: 100%; padding-right: 0">
                    <%for (int i = 0; i < stock.length; i++) 
                    if (user.user.getId() == stock[i].getPersonId()) {%>
                    <option value="<%=stock[i].getId()%>" <% if (transport.getStockId() == stock[i].getId()) {%> selected <% }%>>№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
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
<% }}} %>
<%@include file = "layout2.jsp"%>