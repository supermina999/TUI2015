<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="users.User"%>
<jsp:useBean id="user" class="users.User" scope="session"/>

<%
    boolean isOk = user.tryToLogin(request);
    if (isOk) {%>
        <script>
            window.location.href = "userInfo.jsp?id=<%=user.user.getId()%>";
        </script>
    <%} else {%>
        <script>
            window.history.back();
        </script>
    <%}%>