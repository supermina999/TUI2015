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
    UserController.add(request);
    Person[] persons = Person.getAll(null);
    int id = persons[persons.length - 1].getId();%>
<script>
    window.location.href = "userInfo.jsp?id=<%=id%>";
</script>
<% } %>
<%@include file = "layout2.jsp"%>