<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.ApplicationController"%>
<% 
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>

<%
    ApplicationController.add(request);
%>
<script>
    window.location.href = "/";
</script>

<%@include file = "layout2.jsp"%>