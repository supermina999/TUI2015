<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<%
    String name = request.getParameter("name");
    name = new String(name.getBytes("iso8859-1"), "utf8");
    String address = request.getParameter("address");
    address = new String(address.getBytes("iso8859-1"), "utf8");
    String website = request.getParameter("website");
    DBModel.init();
    Organization organization = new Organization();
    organization.setName(name);
    organization.setAddress(address);
    organization.setWebsite(website);
    organization.writeToDB();
%>
    <script>
        window.location.href = "organizations.jsp";
    </script>

<%@include file = "layout2.jsp"%>