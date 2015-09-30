<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    AvailableResource res = AvailableResource.getOne(id);
    if (res != null)
    {
        %><%=res.getId()%>
<%=res.getResourceName()%>
<%=res.getNumber()%>
<%=Stock.getOne(res.getStockId()).getOrganizationName()%>
<%=res.getLocation().getAddress()%>
<%=res.getLocation().getCityName()%>
<%=res.getLocation().getCountryName()%><%
    }
    else 
    {
        %><%="error"%><%
    }
%>