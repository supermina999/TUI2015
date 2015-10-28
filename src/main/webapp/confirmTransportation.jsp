<%@page import="controllers.ApplicationController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportationController "%>

<%
    int stockId = TransportationController.confirm(request);
%>

<script>
    window.location.href = "stockInfo.jsp?id=<%=stockId%>";
</script>