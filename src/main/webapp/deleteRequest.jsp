<%@page import="controllers.ApplicationController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.RequestController"%>

<%
    RequestController.delete(request);
%>
<script>
    window.location.href = "applications.jsp";
</script>