<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="sql.*"%>
<%@page import="controllers.RequestController"%>
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
    if (request.getParameter("id") == null && !Sql.isInt("id")) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
<%} else {
    boolean b = RequestController.update(request);
    if (!b) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>    
    <%} else {
%>
<script>
    window.location.href = "requestInfo.jsp?id=<%=request.getParameter("id")%>";
</script>
<% }}} %>
<%@include file = "layout2.jsp"%>