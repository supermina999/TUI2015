<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.ResourceController"%>

<%
    ResourceController.transit(request);
    AvailableResource res = AvailableResource.getOne(Integer.parseInt(request.getParameter("resourceId")));
    int base_id = res.getBaseId();
    String isStock = Base.getOne(base_id).isStock() ? "true" : "false";
%>
<script>
    window.location.href = "baseResources.jsp?is_needed=false&id=<%=base_id%>&is_stock=<%=isStock%>";
</script>
