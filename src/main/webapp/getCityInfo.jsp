<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    City city = City.getOne(id);
    if (city != null)
    {
        %><%=city.getId()%>
<%=city.getName()%>
<%=city.getCountryId()%>
<%=city.getCountryName()%><%
    }
    else 
    {
        %><%="error"%><%
    }
%>