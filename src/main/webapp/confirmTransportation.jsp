<%@page import="controllers.ApplicationController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportationController "%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 4) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    int pId = Transportation.getOne(Integer.parseInt(request.getParameter("id"))).getDriverId();
    if (user.user.getId() != pId) {%>
        <%@include file = "wrongPermission.jsp"%>
    <%} else {
    int stockId = TransportationController.confirm(request);
%>

<script>
    window.location.href = "stockInfo.jsp?id=<%=stockId%>";
</script>
<% }} %>
<%@include file = "layout2.jsp"%>