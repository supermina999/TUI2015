<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController"%>

<%
    int stock_id = AvailableResourceController.add(request);
%>
<script>
    window.location.href = "stockResources.jsp?id=<%=stock_id%>";
</script>