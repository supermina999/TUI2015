<%@page import="controllers.ApplicationController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController "%>

<%
    ApplicationController.delete(request);
%>
<script>
    window.location.href = "applications.jsp";
</script>