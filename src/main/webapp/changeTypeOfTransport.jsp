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
    String s = request.getParameter("id");
    TransportType transport = new TransportType();
    int id = -1;
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%} else {
        id = Integer.parseInt(s);
        transport = TransportType.getOne(id);
    }
%>
<br>
<div class="form-block center-block" style="min-height: 1000px;">
    <center><h2 class="title">Изменить вид транспортного средства</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="updateTypeOfTransport.jsp?id=<%=id%>">
        <div class="form-group">
            <label class="col-sm-3 control-label">Название</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="name" value="<%=transport.getName()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Cкорость</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="speed" value="<%=transport.getSpeed()%>">
            </div>
            <p style="font-size: 15px; margin-top: 10px; margin-bottom: 0">км/ч</p>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Вместимость</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="maxWeight" value="<%=transport.getMaxWeight()%>">
            </div>
            <p style="font-size: 15px; margin-top: 10px; margin-bottom: 0">т</p>
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