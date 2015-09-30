<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.StationController"%>

<%
    StationController.update(request);
%>
    <script>
        window.location.href = "stationInfo.jsp?id=<%=request.getParameter("id")%>";
    </script>
