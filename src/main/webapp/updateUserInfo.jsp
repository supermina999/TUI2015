<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    UserController.update(request);
%>
<script>
    window.location.href = "userInfo.jsp?id=<%=request.getParameter("id")%>";
</script>
