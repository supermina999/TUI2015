<%@page import="controllers.PlanController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.ApplicationController"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>

<%
    PlanController.acceptPlan(request);
%>
<script>
    window.location.href = "transportations.jsp";
</script>

<%@include file = "layout2.jsp"%>