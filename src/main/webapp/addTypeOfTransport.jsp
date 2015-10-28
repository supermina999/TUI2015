<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportTypeController"%>

<%
    TransportTypeController.add(request);
%>
<script>
    window.location.href = "typesOfTransport.jsp";
</script>