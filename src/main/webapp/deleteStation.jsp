<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.StationController"%>

<%
    StationController.delete(request);
%>
    <script>
        window.location.href = "stations.jsp";
    </script>
