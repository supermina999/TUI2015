<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 6) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    String s = request.getParameter("id");
    Request req = new Request();
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%
    } else {
        req = Request.getOne(Integer.parseInt(s));
        Application app = Application.getOne(req.getApplicationId());
    }
%>

<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить заявку?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<br>
<div class="form-block center-block" style="width: 50%; min-height: 700px;">
    <div style="margin-left: 90%;" <%if (req.getStatus() == 1) {%> hidden <% } %>>
        <p style="font-size: 25px;"><a href="changeRequestInfo.jsp?id=<%=req.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteRequest.jsp?id=<%=req.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Заявка №<%=req.getId()%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="form-group">
            <p style="font-size: 15px;"> <b>Вид:</b> <%=req.getRequestTypeName()%> </p>
            <p style="font-size: 15px;"> <b>Ресурс:</b> <%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%></p>
            <p style="font-size: 15px;"> <b>Местоположение:</b> <%=req.getLocation().getFullAddress()%> </p>
            <p style="font-size: 15px;"> <b>Дата:</b> <%=req.getDateString()%> </p>
            <hr> <p class="text-center" style="font-size: 20px;"><b>Контактная информация:</b></p><hr>
            <p style="font-size: 15px;"> <b>ФИО:</b> <%=app.getFullName()%> </p>
            <p style="font-size: 15px;"> <b>Телефон:</b> <%=app.getPhone()%> </p>
            <p style="font-size: 15px;"> <b>Email:</b> <%=app.getEmail()%> </p>
            <hr><p class="text-center" style="font-size: 20px;"><b>Информация о перевозке:</b></p><hr>
            <% if (req.getStatus() == 0) {%>
            <p style="font-size: 15px;"> <b>Статус:</b> <%=req.getStatusName()%> </p>
            <% } else {
                DBEntry[] params = {
                    new DBEntry("request_id", EntryType.Int, Integer.parseInt(s))
                };
                Transportation transit = Transportation.getOne(params); %>
                <p style="font-size: 15px;"> <b>Статус:</b> <%=transit.getStatusName()%> </p>
                <p style="font-size: 15px;"> <b>Транспортное средство:</b> <%=transit.getTransportName()%><a href="transportInfo.jsp?id=<%=transit.getTransportId()%>"> <%=transit.getTransportNumber()%></a></p>
            <p style="font-size: 15px;"> <b>Водитель:</b> <a href="userInfo.jsp?id=<%=transit.getDriverId()%>"> <%=transit.getDriverName()%></a> </p>
            <p style="font-size: 15px;"> <b>Отправление:</b> <%=transit.getTimeStart() %> </p>
            <p style="font-size: 15px;"> <b>Прибытие:</b> <%=transit.getTimeFinish() %> </p>   
            <p style="font-size: 15px;"> <b>Опасность пути:</b> <%=transit.getSafetyName()%> </p>   
            <%}%>
        </div>
        <div class="form-group"></div>
    </form>
</div>
<br>
<% } %>
<%@include file = "layout2.jsp"%>