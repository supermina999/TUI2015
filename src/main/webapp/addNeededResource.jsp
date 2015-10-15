<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.NeededResourceController"%>

<%
    NeededResource res = NeededResourceController.add(request);
    int base_id = res.getBaseId();
    String isStock = Base.getOne(base_id).isStock() ? "true" : "false";
%>
<script>
    window.location.href = "baseResources.jsp?is_needed=false&id=<%=base_id%>&is_stock=<%=isStock%>";
</script>