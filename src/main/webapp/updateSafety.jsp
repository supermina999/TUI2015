<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.MapsController"%>
<%@ page import="javafx.collections.MapChangeListener" %>
<%
  int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
  if (!isLogin) {%>
<script>
  window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 3) {%>
<%@include file = "wrongPermission.jsp"%>
<%} else {
  MapsController.updateSafety(request);
%>
<script>
  window.location.href = "/";
</script>
<% } %>
<%@include file = "layout2.jsp"%>