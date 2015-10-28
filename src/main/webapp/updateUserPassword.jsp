<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    UserController.updatePassword(request);
%>
<script>
    window.location.href = "exit.jsp";
</script>