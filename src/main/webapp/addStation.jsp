<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.StationController"%>
<%
    StationController.add(request);
%>
<script>
    window.location.href = "stations.jsp";
</script>