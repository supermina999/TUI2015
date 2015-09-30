<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.StockController"%>

<%
    StockController.add(request);
%>
    <script>
        window.location.href = "stocks.jsp";
    </script>