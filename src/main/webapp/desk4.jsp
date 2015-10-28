<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DBEntry[] params = {
        new DBEntry("person_id", EntryType.Int, person.getId())
    };
    Transport[] transport = Transport.getAll(params);
%>

<center>
    <%
        for (int i = 0; i < transport.length; i++) {%>
            <a class="btn btn-default btn-block" href="transportInfo.jsp?id=<%=transport[i].getId()%>"><%=transport[i].getName()%> <%=transport[i].getNumber()%></a>
        <%}
    %>
    <a class="btn btn-default btn-block" href="exit.jsp"><i class="fa fa-sign-out"></i> Выйти</a>
</center>
