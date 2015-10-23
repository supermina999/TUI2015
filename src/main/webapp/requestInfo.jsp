<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 0;
    String s = request.getParameter("id");
    Request req = new Request();
    Application app = Application.getOne(req.getApplicationId());
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%
    } else {
        req = Request.getOne(Integer.parseInt(s));
    }
%>
<%@include file = "layout1.jsp"%>
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
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeRequestInfo.jsp?id=<%=req.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteRequest.jsp?id=<%=req.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Заявка №<%=req.getId()%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="form-group">
            <p style="font-size: 15px;"> <b>Вид:</b> <%=req.getRequestTypeName()%> </p>
            <p style="font-size: 15px;"> <b>Ресурс:</b> <%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%></p>
            <p style="font-size: 15px;"> <b>Местоположение:</b> <%=req.getLocation().getAddress()%>, <%=req.getLocation().getRegionName()%>, <%=req.getLocation().getCountryName()%> </p>
            <p style="font-size: 15px;"> <b>Дата:</b> <%=req.getDateString()%> </p>
            <hr> <p class="text-center" style="font-size: 20px;"><b>Контактная информация:</b></p><hr>
            <p style="font-size: 15px;"> <b>ФИО:</b> <%=app.getFullName()%> </p>
            <p style="font-size: 15px;"> <b>Телефон:</b> <%=app.getPhone()%> </p>
            <p style="font-size: 15px;"> <b>Email:</b> <%=app.getEmail()%> </p>
            <hr><p class="text-center" style="font-size: 20px;"><b>Информация о транспортировке:</b></p><hr>
            <p style="font-size: 15px;"> <b>Статус:</b>  </p>
        </div>
        <div class="form-group"></div>
    </form>
</div>


<%@include file = "layout2.jsp"%>