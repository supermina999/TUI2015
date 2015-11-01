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
<%} else if (user.user.getPermissionId() != 1) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    String login = request.getParameter("login");
    String pass1 = request.getParameter("password1");
    String pass2 = request.getParameter("password2");
    if (login == null || pass1 == null || pass2 == null) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
    <% } else {
    DBEntry[] params = {
        new DBEntry("login", EntryType.String, login)
    };
    if (Person.getOne(params) != null) {%>
    <script>
        window.location.href = "loginExists.jsp";
    </script>
    <% } else if (!pass1.equals(pass2)) {%>
    <script>
        window.location.href = "passwordMismatch.jsp";
    </script>
    <% } else {
    boolean b = UserController.add(request);
    if (!b) {%>
    <script>
        window.location.href = "incorrectData.jsp";
    </script>
    <% } else {
    Person[] persons = Person.getAll(null);
    int id = persons[persons.length - 1].getId();
%>
<script>
    window.location.href = "userInfo.jsp?id=<%=id%>";
</script>
<% }}}} %>
<%@include file = "layout2.jsp"%>