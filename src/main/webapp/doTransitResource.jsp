<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.ResourceController"%>

<%
    ResourceController.transit(request);
    AvailableResource res = AvailableResource.getOne(Integer.parseInt(request.getParameter("resourceId")));
    int stock_id = res.getStockId();
%>
<script>
    window.location.href = "stockResources.jsp?id=<%=stock_id%>";
</script>
