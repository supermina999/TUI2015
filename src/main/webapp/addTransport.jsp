<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportController"%>

<%
    TransportController.add(request);
%>
<script>
    window.location.href = "transport.jsp";
</script>