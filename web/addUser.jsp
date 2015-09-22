<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.UserController"%>

<%
    String result = UserController.add(request);
    if (result != "OK")
    {%>
        <script>
            window.location.href = "register.jsp?alert=<%=result%>";
        </script>  
    <%} else {%>
%>
    <script>
        window.location.href = "organizations.jsp";
    </script>
    <% } %>