<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.MapsController"%>
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
  window.location.href = "showSafety.jsp";
</script>
<% } %>
<%@include file = "layout2.jsp"%>