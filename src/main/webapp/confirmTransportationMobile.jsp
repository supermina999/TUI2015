<%@page import="controllers.ApplicationController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.TransportationController "%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
    int stockId = TransportationController.confirm(request);
%>

<script>
    window.location.href = "transportations.jsp";
</script>
<% %>
<%@include file = "layout2.jsp"%>