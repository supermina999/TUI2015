<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.StationController"%>

<% int minPermission = 8; 
   int tab = 5; %>
<%@include file = "layout1.jsp"%>
<%
    StationController.add(request);
%>
    <script>
        window.location.href = "stations.jsp";
    </script>

<%@include file = "layout2.jsp"%>