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
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 5 && user.user.getPermissionId() != 6) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    Region[] region = Region.getAll(null);
    Stock[] stock = Stock.getAll(null);
    Measure[] measure = Measure.getAll(null);
%>
<br>
<div class="form-block center-block" style="min-height: 1000px;">
    <center><h2 class="title">Добавить вид ресурса</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="addTypeOfResource.jsp">
        <div class="form-group">
            <label class="col-sm-3 control-label">Наименование</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="name"Q>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Вес</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="weight">
            </div>
            <p style="font-size: 15px; margin-top: 10px; margin-bottom: 0">кг</p>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Единица измерения</label>
            <div class="col-sm-8">
                <select class="form-control" name="measure" id="measure" style="width: 100%; padding-right: 0">
                    <option>Выберите единицу измерения</option>
                    <%for (int i = 0; i < measure.length; i++) {%>
                    <option value="<%=measure[i].getId()%>"><%=measure[i].getName()%></option>
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