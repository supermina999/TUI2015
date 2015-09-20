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
    Station[] station1 = Station.getAll(null);    
    int prevId;
    if (station1.length == 0) prevId = 0;
    else prevId = station1[station1.length-1].getId();
    Station station = new Station();
    station.setId(prevId+1);
    station.setLocationId(Integer.parseInt(address_id));
    station.setOrganizationId(Integer.parseInt(organization_id));
    station.writeToDB();
%>
    <script>
        window.location.href = "stations.jsp";
    </script>

<%@include file = "layout2.jsp"%>