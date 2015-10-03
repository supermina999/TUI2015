<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    UserController.delete(request);
%>
    <script>
        window.location.href = "index.jsp";
    </script>
