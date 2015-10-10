<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Organization organization = Organization.getOne(id);
    if (organization != null) {
%><%=organization.getId()%>
<%=organization.getName()%>
<%=organization.getAddress()%>
<%=organization.getWebsite()%><%
} else {
%><%="error"%><%
            }
%>