<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.ResourceController"%>

<%
    ResourceController.change(request);
%>
<script>
        window.location.href = "typeOfResources.jsp";
</script>