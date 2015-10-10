<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Country country = Country.getOne(id);
    if (country != null) {
%><%=country.getId()%>
<%=country.getName()%>
}
else 
{
%><%="error"%><%
            }
%>