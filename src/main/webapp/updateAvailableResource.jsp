<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController "%>

<%
    AvailableResourceController.update(request);
%>
    <script>
        window.location.href = "availableResources.jsp";
    </script>
