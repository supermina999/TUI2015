<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.ApplicationController"%>
<% 
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>

<%
    boolean b = ApplicationController.add(request);
    if (!b) {%>
<script>
    window.location.href = "incorrectData.jsp";
</script>
    <% } else {%>
<script>
    window.location.href = "applicationAccepted.jsp";
</script>
<% } %>
<%@include file = "layout2.jsp"%>