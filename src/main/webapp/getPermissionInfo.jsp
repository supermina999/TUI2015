<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Permission permission = Permission.getOne(id);
    if (permission != null)
    {
        %><%=permission.getId()%>
<%=permission.getName()%>
    }
    else 
    {
        %><%="error"%><%
    }
%>