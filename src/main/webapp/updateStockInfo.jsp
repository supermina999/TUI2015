<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.StockController"%>

<%
    StockController.update(request);
%>
<script>
    window.location.href = "stockInfo.jsp?id=<%=request.getParameter("id")%>";
</script>
