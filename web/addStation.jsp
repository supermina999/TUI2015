<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 5; %>
<%@include file = "layout1.jsp"%>
<%
    String address_id = request.getParameter("address");
    String organization_id = request.getParameter("organization");
    DBModel.init();
    Station station = new Station();
    station.setLocationId(Integer.parseInt(address_id));
    station.setOrganizationId(Integer.parseInt(organization_id));
    station.writeToDB();
%>
    <script>
        window.location.href = "stations.jsp";
    </script>

<%@include file = "layout2.jsp"%>