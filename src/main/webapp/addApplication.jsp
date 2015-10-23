<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.ApplicationController"%>

<%
    ApplicationController.add(request);
%>
<script>
    window.location.href = "/";
</script>