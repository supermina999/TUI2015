<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Station station = Station.getOne(id);
    if (station != null)
    {
        %><%=station.getId()%>
<%=station.getOrganizationId()%>
<%=station.getLocation().getCityId()%>
<%=station.getOrganizationName()%>
<%=station.getLocation().getAddress()%>
<%=station.getLocation().getCityName()%>
<%=station.getLocation().getCountryName()%><%
    }
    else 
    {
        %><%="error"%><%
    }
%>