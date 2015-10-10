<%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    int id = Integer.parseInt(request.getParameter("id"));
    Person person = Person.getOne(id);
    if (person != null) {
%><%=person.getId()%>
<%=person.getName()%>
<%=person.getSurname()%>
<%=person.getSecondName()%>
<%=person.getAddress()%>
<%=person.getCityName()%>
<%=person.getEmail()%>
<%=person.getPhone()%>
<%=person.getPermissionName()%>
<%=person.getOrganizationName()%>
<%=person.getOrganizationId()%>
<%=person.getPermissionId()%>
<%=person.getCityId()%>
<%=City.getOne(person.getCityId()).getCountryId()%>
<%=person.getLogin()%><%
} else {
%><%="error"%><%
            }
%>