<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.RequestController"%>
<%@page import="controllers.ApplicationController"%>

<%
    ApplicationController.changeStatus(Integer.parseInt(request.getParameter("applicationId")));
    RequestController.add(request);
%>
<script>
    window.location.href = "applications.jsp#h2tab2";
</script>