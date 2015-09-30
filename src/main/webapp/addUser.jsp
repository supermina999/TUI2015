<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    String result = UserController.add(request);
    if (!result.equals("OK"))
    {%>
        <center><h2><%=result%></h2></center>
    <%} else {
    Person[] persons = Person.getAll(null);
    int id = persons[persons.length-1].getId();%>
    <script>
        window.location.href = "userInfo.jsp?id=<%=id%>";
    </script>
    <% } %>