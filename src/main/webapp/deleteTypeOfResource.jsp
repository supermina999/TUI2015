<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.ResourceController"%>

<%
    ResourceController.delete(request);
%>
<script>
        window.location.href = "typesOfResources.jsp";
</script>