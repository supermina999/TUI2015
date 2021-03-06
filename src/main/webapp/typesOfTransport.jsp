<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 5;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 5) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    TransportType[] transport = TransportType.getAll(null);
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить вид траспортного средства?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 1200px;">
        <div style="margin-left: 38%;">
            <p><a href="newTypeOfTransport.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить вид</a></p>
        </div>
        <center>
            <h1>Виды транспортных средств</h1><br> </center>
        <div class="form-group has-feedback" style="width: 50%; min-height: 1200px;">
            <div class="gray-bg">
                <br>
                <div class="col-md-11" style="width: 98%">
                    <input type="text" class="form-control searchInputText" placeholder="Поиск" style="width: 102%;">
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 50%;">Название</th>
                        <th style="width: 20%;">Скорость</th>
                        <th style="width: 20%;">Вместимость</th>
                        <th style="width: 5%;"></th>
                        <th style="width: 5%;"></th>
                    </tr>
                </thead>
                <tbody id="searchTable">
                    <%
                    for (int i = 0; i < transport.length; i++) {%>
                    <tr>
                        <td class="idSearch"> <%= transport[i].getName()%> </td>
                        <td><%= transport[i].getSpeed()%> км/ч</td>
                        <td><%= transport[i].getMaxWeight()%> т</td>
                        <td><a href="changeTypeOfTransport.jsp?id=<%=transport[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                        <td><a href="deleteTypeOfTransport.jsp?id=<%=transport[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>
</center>
<% } %>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>