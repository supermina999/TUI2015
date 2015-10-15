<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%
    int minPermission = 8;
    int tab = 4;
    int id = Integer.parseInt(request.getParameter("id"));
    boolean isStock = request.getParameter("is_stock").equals("true");
    boolean isNeeded = request.getParameter("is_needed").equals("true");
    Base base = Base.getOne(id);
    NeededResource[] needed = null;
    AvailableResource[] available = null;
    DBEntry[] params = {
        new DBEntry("base_id", EntryType.Int, id)
    };
    if (isNeeded) needed = NeededResource.getAll(params);
    else available = AvailableResource.getAll(params);
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить информацию о ресурсе?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<%@include file = "layout1.jsp"%>
<center>
    <br><h1><%=isNeeded?"Требующиеся ресурсы":"Ресурсы в наличии"%> <%=isStock?"склада":"пункта выдачи"%></h1>
    <h3>Адрес <%=isStock ? "склада" : "пункта выдачи"%>: <%=base.getLocation().getCountryName() +
            ", " + base.getLocation().getCityName() + ", " +base.getLocation().getAddress()%></h3><br>
        <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
            <div class="gray-bg">
                <br>
                <div class="col-md-11">
                    <input type="text" class="form-control searchInput" placeholder="Название" style="width: 103%;" >
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 70%;">Название</th>
                        <th style="width: 20%;">Количество</th>    
                         <th style="width: 5%;"></th>
                        <th style="width: 5%;"></th>
                    </tr>
                </thead>
                <tbody id="searchTable">
                    <%
                    if (isNeeded)
                    for (int i = 0; i < needed.length; i++) {%>
                        <tr>
                            <td class="quantity"> <%=needed[i].getResourceName()%></td>
                            <td class="amount"><%=needed[i].getNumber()%></td>
                            <td><a href="changeResource.jsp?is_needed=true&id=<%=needed[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteNeededResource.jsp?id=<%=needed[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                        </tr>
                    <% }
                    else 
                        for (int i = 0; i < available.length; i++) {%>
                        <tr>
                            <td class="quantity"> <%=available[i].getResourceName()%></td>
                            <td class="amount"><%=available[i].getNumber()%></td>      
                            <td><a href="changeResource.jsp?is_needed=false&id=<%=available[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteAvailableResource.jsp?id=<%=available[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

        <a href="newResource.jsp?base_id=<%=id%>&is_needed=<%=isNeeded ? "true" : "false" %>" class="btn btn-default btn-lg">Добавить ресурс</a>
        <%if(!isNeeded){%><a href="transitResource.jsp?base_id=<%=id%>" class="btn btn-default btn-lg">Перевезти ресурс</a>
        <%}%>
        </div>
</center>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>