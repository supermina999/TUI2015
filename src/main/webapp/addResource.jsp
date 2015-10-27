<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController"%>

<%
    int stockId = AvailableResourceController.add(request);
%>
<script>
    window.location.href = "stockInfo.jsp?id=<%=stockId%>";
</script>