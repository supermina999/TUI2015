<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DBEntry[] params = {
        new DBEntry("person_id", EntryType.Int, person.getId())
    };
    Stock[] stock = Stock.getAll(params);
%>

<center>
    <%
        for (int i = 0; i < stock.length; i++) {%>
            <a class="btn btn-default btn-block" href="stockInfo.jsp?id=<%=stock[i].getId()%>"> Склад №<%=stock[i].getId()%></a>
        <%}
    %>
    <a class="btn btn-default btn-block" href="typesOfResources.jsp"> Виды ресурсов</a>
    <a class="btn btn-default btn-block" href="typesOfTransport.jsp"> Виды транспорта</a>
    <a class="btn btn-default btn-block" href="newTypeOfResource.jsp"><i class="fa fa-plus"></i> Добавить вид ресурса</a>
    <a class="btn btn-default btn-block" href="newTypeOfTransport.jsp"><i class="fa fa-plus"></i> Добавить вид транспорта</a>
    <a class="btn btn-default btn-block" href="newResource.jsp"><i class="fa fa-plus"></i> Добавить ресурс на склад</a>
    <a class="btn btn-default btn-block" href="newTypeOfTransport.jsp"><i class="fa fa-plus"></i> Добавить транспорт на склад</a>
    <a class="btn btn-default btn-block" href="exit.jsp"><i class="fa fa-sign-out"></i> Выйти</a>
</center>
