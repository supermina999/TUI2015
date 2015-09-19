<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<%
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String website = request.getParameter("website");
    DBModel.init();
    Organization organization = new Organization();
    organization.setName(name);
    organization.setAddress(address);
    organization.setWebsite(website);
    organization.writeToDB();
%>

<%=name%><br>
<%=address%><br>
<%=website%><br>
<%@include file = "layout2.jsp"%>