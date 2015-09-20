<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 4; %>
<%@include file = "layout1.jsp"%>
<%
    String address_id = request.getParameter("address");
    String organization_id = request.getParameter("organization");
    DBModel.init();
    Stock[] stock1 = Stock.getAll(null);    
    int prevId;
    if (stock1.length == 0) prevId = 0;
    else prevId = stock1[stock1.length-1].getId();
    Stock stock = new Stock();
    stock.setId(prevId+1);
    stock.setLocationId(Integer.parseInt(address_id));
    stock.setOrganizationId(Integer.parseInt(organization_id));
    stock.writeToDB();
%>
    <script>
        window.location.href = "stocks.jsp";
    </script>

<%@include file = "layout2.jsp"%>