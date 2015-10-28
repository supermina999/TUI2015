<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportTypeController"%>

<%
    TransportTypeController.change(request);
%>
<script>
    window.location.href = "typesOfTransport.jsp";
</script>