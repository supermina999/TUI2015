<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.NeededResourceController "%>

<%
    NeededResourceController.delete(request);
%>
<script>
    window.location.href = "neededResources.jsp";
</script>
