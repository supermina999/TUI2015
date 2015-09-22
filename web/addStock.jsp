<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.StockController"%>

<% int minPermission = 8; 
   int tab = 4; %>
<%@include file = "layout1.jsp"%>
<%
    StockController.add(request);
%>
    <script>
        window.location.href = "stocks.jsp";
    </script>

<%@include file = "layout2.jsp"%>