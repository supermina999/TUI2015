<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="sql.Sql"%>
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
    String login = request.getParameter("login");
    String id = request.getParameter("id");
    if (login == null || id == null || !Sql.isInt(id)) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
    <% } else {
    DBEntry[] params = {
        new DBEntry("login", EntryType.String, login)
    };
    if (Person.getOne(params) != null && Person.getOne(params).getId() != Integer.parseInt(id)) {%>
    <script>
        window.location.href = "loginExists.jsp";
    </script>
    <% } else {
    boolean b = UserController.update(request);
    if (!b) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
    <% } else {
%>
<script>
    window.location.href = "userInfo.jsp?id=<%=request.getParameter("id")%>";
</script>
<% }}}} %>
<%@include file = "layout2.jsp"%>