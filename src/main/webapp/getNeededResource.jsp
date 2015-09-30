<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    NeededResource res = NeededResource.getOne(id);
    if (res != null)
    {
        %><%=res.getId()%>
<%=res.getResourceName()%>
<%=res.getNumber()%>
<%=Station.getOne(res.getStationId()).getOrganizationName()%>
<%=res.getLocation().getAddress()%>
<%=res.getLocation().getCityName()%>
<%=res.getLocation().getCountryName()%><%
    }
    else 
    {
        %><%="error"%><%
    }
%>