<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.OrganizationController"%>

<%
    OrganizationController.update(request);
%>
    <script>
        window.location.href = "organizations.jsp";
    </script>
