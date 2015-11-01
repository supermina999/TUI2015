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
    String id = request.getParameter("id");
    String pass1 = request.getParameter("password1");
    String pass2 = request.getParameter("password2");
    String pass = request.getParameter("passwordOld");
    if (id == null || pass == null || !Sql.isInt(id) || pass1 == null || pass2 == null) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
    <% } else {
    DBEntry[] params = {
        new DBEntry("id", EntryType.String, id)
    };
    if (!Person.getOne(params).getPassword().equals(Sql.md5(pass))) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
    <% } else {
    boolean b = UserController.updatePassword(request);
    if (!b) {%>
    <script>
        window.location.href = "passwordMismatch.jsp";
    </script>
    <% } else {
%>
<script>
    window.location.href = "exit.jsp";
</script>
<% }}}} %>
<%@include file = "layout2.jsp"%>