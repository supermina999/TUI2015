<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.organizationController"%>

<%
    organizationController.add(request);
%>
    <script>
        window.location.href = "organizations.jsp";
    </script>
