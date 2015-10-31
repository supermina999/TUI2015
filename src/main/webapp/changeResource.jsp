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
    AvailableResource resource = new AvailableResource();
    int id = 0;
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%} else {
        id = Integer.parseInt(s);
        resource = AvailableResource.getOne(id);
        if (Stock.getOne(resource.getStockId()).getPersonId() != user.user.getId()) {%>
             <%@include file = "wrongPermission.jsp"%>
        <%} else {
%>
<br>
<div class="form-block center-block" style="width: 40%; min-height: 500px;">
    <center><h2 class="title">Изменить информацию о ресурсе</h2></center>
    <hr>
    <form class="form-horizontal" method = "post" action = "updateResourceInfo.jsp?id=<%=id%>">
        <div class="form-group has-feedback" style="margin-bottom: 0">
            <label class="col-sm-3 control-label">Cклад</label>
            <div class="col-sm-8">
                <p style="margin: 0; margin-top: 7px;">№<%=resource.getStockId()%>, <%=resource.getStockAddress()%></p>
            </div>
        </div>
        <div class="form-group has-feedback" style="margin-top: 0">
            <label class="col-sm-3 control-label">Вид ресурса</label>
            <div class="col-sm-8">
                <p style="margin: 0; margin-top: 7px;"><%=resource.getResourceName()%>, <%=resource.getMeasureName()%></p>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Количество</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="number" value="<%=resource.getNumber()%>" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">					
                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
            </div>
        </div>
    </form>
</div>
<br>
<% }}}%>
<%@include file = "layout2.jsp"%>