<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Stock stock = Stock.getOne(id);
    if (stock != null)
    {
        %><%=stock.getId()%>
<%=stock.getOrganizationId()%>
<%=stock.getLocation().getCityId()%>
<%=stock.getLocation().getCountryId()%>
<%=stock.getOrganizationName()%>
<%=stock.getLocation().getAddress()%>
<%=stock.getLocation().getCityName()%>
<%=stock.getLocation().getCountryName()%><%
    }
    else 
    {
        %><%="error"%><%
    }
%>