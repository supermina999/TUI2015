<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.RequestController"%>
<%@page import="controllers.ApplicationController"%>

<%
    ApplicationController.changeStatus(Integer.parseInt(request.getParameter("application_id")));
    int id = RequestController.add(request);
%>
<script>
    window.location.href = "requestInfo.jsp?id=<%=id%>";
</script>