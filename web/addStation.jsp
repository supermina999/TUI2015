<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 5; %>
<%@include file = "layout1.jsp"%>
<%
    String address = request.getParameter("address");
    String organization_id = request.getParameter("organization");
    String city_id = request.getParameter("city");
    DBModel.init();
    Station station = new Station();
    Location location = new Location();
    location.setCityId(Integer.parseInt(city_id));
    location.setAddress(address);
    location.setXCoord(1);
    location.setYCoord(1);
    location.writeToDB();
    Location[] all_locations = Location.getAll(null);
    station.setLocationId(all_locations.length);
    station.setOrganizationId(Integer.parseInt(organization_id));
    station.writeToDB();
%>
    <script>
        window.location.href = "stations.jsp";
    </script>

<%@include file = "layout2.jsp"%>