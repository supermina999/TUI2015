<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.StockController"%>

<%
    StockController.delete(request);
%>
    <script>
        window.location.href = "stocks.jsp";
    </script>
