<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="users.User"%>
<jsp:useBean id="user" class="users.User" scope="session"/>

<%
    user.exit();
%>

<script>
    window.location.href = "index.jsp";
</script>