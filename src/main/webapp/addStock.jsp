<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.StockController"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 3) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    StockController.add(request);
%>
<script>
    window.location.href = "stocks.jsp";
</script>
<% } %>
<%@include file = "layout2.jsp"%>