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
    Resource[] resource = Resource.getAll(null);
    Region[] region = Region.getAll(null);
    Stock[] stock = Stock.getAll(null);
%>
<br>
<div class="form-block center-block" style="min-height: 1000px;">
    <center><h2 class="title">Добавить ресурс</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="addResource.jsp">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Ресурс</label>
            <div class="col-sm-7">
                <select class="form-control" name="resource_id" id="resource_id" style="width: 100%; padding-right: 0">
                    <option selected>Выберите вид ресурса</option>
                    <%for (int i = 0; i < resource.length; i++) {%>
                    <option value="<%=resource[i].getId()%>"><%=resource[i].getName()%>, <%=resource[i].getMeasureName()%></option>
                    <%}%>
                </select>
            </div>
            <div style="margin-top: 5px;">
                <a href="newTypeOfResource.jsp?" style="font-size: 20px;"><i class="fa fa-plus"></i></a>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Количество</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="number" style="padding-right: 0" required>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Склад</label>
            <div class="col-sm-8">
                <select class="form-control" name="stock_id" id="stock_id" style="width: 100%; padding-right: 0">
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