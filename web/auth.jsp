<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="users.User"%>
<%@page import="controllers.UserController"%>
<jsp:useBean id="user" class="users.User" scope="session"/>

<%
    boolean isOk = UserController.login(request);
    if (isOk) {%>
        <script>
            window.location.href = "userInfo.jsp";
        </script>
    <%} else {%>
        <script>
            window.location.href = "/"
        </script>
    <%}%>
        
<%@include file="layout2.jsp" %>