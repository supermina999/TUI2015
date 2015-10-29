<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController"%>
<%
    int tab = 0;
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
    int stockId = AvailableResourceController.add(request);
%>
<script>
    window.location.href = "stockInfo.jsp?id=<%=stockId%>";
</script>
<% } %>
<%@include file = "layout2.jsp"%>