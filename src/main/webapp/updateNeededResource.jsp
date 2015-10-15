<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.NeededResourceController "%>

<%
    NeededResourceController.update(request);
     NeededResource res =  NeededResource.getOne(Integer.parseInt(request.getParameter("id")));
    int base_id = res.getBaseId();
    String isStock = Base.getOne(base_id).isStock() ? "true" : "false";
%>
<script>
    window.location.href = "baseResources.jsp?is_needed=true&id=<%=base_id%>&is_stock=<%=isStock%>";
</script>
