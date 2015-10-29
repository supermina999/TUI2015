<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getId() != Integer.parseInt(request.getParameter("id"))) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    UserController.update(request);
%>
<script>
    window.location.href = "userInfo.jsp?id=<%=request.getParameter("id")%>";
</script>
<% } %>
<%@include file = "layout2.jsp"%>