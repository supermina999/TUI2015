<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Person person = Person.getOne(id);
    if (person != null) {
%><%=person.getId()%>
<%=person.getName()%>
<%=person.getSurname()%>
<%=person.getSecondName()%>
<%=person.getPermissionName()%>
<%
} else {
%><%="error"%><%
            }
%>