<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportController"%>
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
    if (user.user.getId() != Transport.getOne(Integer.parseInt(request.getParameter("id"))).getPersonId() && user.user.getPermissionId() != 1) {%>
    <%@include file = "wrongPermission.jsp"%>
    <%} else {
    TransportController.delete(request);
%>
<script>
    window.location.href = "transport.jsp";
</script>
<% }} %>
<%@include file = "layout2.jsp"%>
