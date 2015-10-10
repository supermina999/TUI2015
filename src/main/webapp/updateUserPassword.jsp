<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    String result = UserController.updatePassword(request);
    if (!result.equals("OK")) {%>
<center><h2><%=result%></h2></center>
        <%} else {%>
<script>
    window.location.href = "userInfo.jsp?id=<%=request.getParameter("id")%>";
</script>
<% }%>