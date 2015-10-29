<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.RequestController"%>
<%@page import="controllers.ApplicationController"%>
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
    ApplicationController.changeStatus(Integer.parseInt(request.getParameter("application_id")));
    int id = RequestController.add(request);
%>
<script>
    window.location.href = "requestInfo.jsp?id=<%=id%>";
</script>
<% } %>
<%@include file = "layout2.jsp"%>