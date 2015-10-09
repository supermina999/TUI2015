<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Resource res = Resource.getOne(id);
    if (res != null)
    {
        %><%=res.getId()%>
<%=res.getName()%>
<%=res.getWeight()%><%
    }
    else 
    {
        %><%="error"%><%
    }
%>