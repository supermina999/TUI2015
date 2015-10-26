<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.AvailableResourceController "%>

<%
    int id = AvailableResourceController.update(request);
%>
<script>
    window.location.href = "stockInfo.jsp?id=<%=id%>";
</script>
