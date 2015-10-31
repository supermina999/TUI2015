<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController "%>
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
    AvailableResource res = AvailableResourceController.delete(request);
    int stock_id = res.getStockId();
    if (Stock.getOne(res.getStockId()).getPersonId() != user.user.getId()) {%>
        <%@include file = "wrongPermission.jsp"%>
    <%} else {
%>
<script>
    window.location.href = "stockInfo.jsp?id=<%=stock_id%>";
</script>
<% }} %>
<%@include file = "layout2.jsp"%>