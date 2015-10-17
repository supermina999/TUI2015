<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    UserController.add(request);
    Person[] persons = Person.getAll(null);
    int id = persons[persons.length - 1].getId();%>
<script>
    window.location.href = "userInfo.jsp?id=<%=id%>";
</script>