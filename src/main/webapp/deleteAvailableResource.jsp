<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController "%>

<%
    AvailableResource res = AvailableResourceController.delete(request);
    int stock_id = res.getStockId();
%>
<script>
    window.location.href = "stockResources.jsp?id=<%=stock_id%>";
</script>