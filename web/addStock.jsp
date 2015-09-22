<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 4; %>
<%@include file = "layout1.jsp"%>
<%
    String address = request.getParameter("address");
    String organization_id = request.getParameter("organization");
    String city_id = request.getParameter("city");
    DBModel.init();
    Stock stock = new Stock();
    Location location = new Location();
    location.setCityId(Integer.parseInt(city_id));
    location.setAddress(address);
    location.setXCoord(1);
    location.setYCoord(1);
    location.writeToDB();
    Location[] all_locations = Location.getAll(null);
    stock.setLocationId(all_locations.length);
    stock.setOrganizationId(Integer.parseInt(organization_id));
    stock.writeToDB();
%>
    <script>
        window.location.href = "stocks.jsp";
    </script>

<%@include file = "layout2.jsp"%>