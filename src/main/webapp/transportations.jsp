<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 6;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 2 && user.user.getPermissionId() != 4) {%>
<%@include file = "wrongPermission.jsp"%>
<%} else {
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    Region[] region = Region.getAll(null);
    Stock[] stock = Stock.getAll(null);
    Transport[] transport = Transport.getAll(null);
    TransportType[] transportType = TransportType.getAll(null);
    Transportation[] transit = Transportation.getAll(null);
%>
<script>
    function confirmConfirm() {
        if (confirm("Вы уверены, что хотите подтвердить, что груз успешно доставлен/получен?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 1200px;">
        <center>
            <h1>Расписание перевозок</h1><br> </center>
        <div class="form-group has-feedback" style="width: 75%; min-height: 1200px;">
            <div class="tabs-style-2">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="glyphicon glyphicon-list-alt"></i> План перевозок</a></li>
                    <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-truck"></i> Архив перевозок</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="h2tab1" style="min-height: 1200px;">
                        <div class="gray-bg">
                            <br>
                            <div class="col-lg-2" style="width: 20%">
                                <input type="date" class="form-control searchInput" style="width: 115%;" >
                                <i class="fa fa-calendar-o form-control-feedback"></i>
                            </div>
                            <div class="col-md-3" style="width: 25%">
                                <select class="form-control searchInput region" style="width: 105%; padding: 0; padding-left: 5px" name = "region">
                                    <option>Выберите область</option>
                                    <%for (int i = 0; i < region.length; i++) {%>
                                    <option><%=region[i].getName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-md-3" style="width: 30%">
                                <select class="form-control searchInput" style="width: 105%; padding: 0; padding-left: 5px" name = "stock">
                                    <option>Выберите склад</option>
                                    <%for (int i = 0; i < stock.length; i++) {%>
                                    <option>№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-md-3" style="width: 25%">
                                <select class="form-control searchInput" style="width: 100%; padding: 0; padding-left: 5px" name = "stock">
                                    <option>Выберите вид транспорта</option>
                                    <%for (int i = 0; i < transportType.length; i++) {%>
                                    <option><%=transportType[i].getName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <br><br><br>
                        </div> <br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th style="width: 1%;"><center>№</center></th>
                            <th style="width: 20%;">Ресурс</th>
                            <th style="width: 20%;">Транспорт</th>
                            <th style="width: 20%;">Время</th>
                            <th style="width: 34%;">Транспортировка</th>
                            <th style="width: 5%;"></th>
                            </tr>
                            </thead>
                            <tbody id="searchTable">
                                <%
                                    for (int i = 0; i < transit.length; i++) if (transit[i].getStatus() == 0) {
                                        Request req = Request.getOne(transit[i].getRequestId());
                                        if (user.user.getPermissionId() != 4 || user.user.getId() == transit[i].getDriverId()){
                                %>
                                <tr>
                                    <td class="idSearch">
                            <center><%=transit[i].getId()%></center>
                            </td>
                            <td class="idSearch">
                                <b>Заявка: <% if (user.user.getPermissionId() == 1) {%><a href="requestInfo.jsp?id=<%=req.getId()%>"><% } %>№<%=req.getId()%><% if (user.user.getPermissionId() == 1) {%></a><% } %><br></b>
                                <b>Вид: </b><%=req.getRequestTypeName()%><br>
                                <b>Ресурс: </b><%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%>
                            </td>
                            <td class="idSearch">
                                <b>Вид:</b> <%=transit[i].getTransportName()%><br>
                                <b>Номер:</b> <%=transit[i].getTransportNumber()%><br>
                                <b>Водитель: </b><% if (user.user.getPermissionId() == 1) {%><a href="userInfo.jsp?id=<%=transit[i].getDriverId()%>"><% } %><%=transit[i].getDriverName()%><% if (user.user.getPermissionId() == 1) {%></a><% } %><br>
                            </td>
                            <td class="idSearch">
                                <b>Дата:</b> <%=req.getDateString()%> <br>
                                <b>Отправление:</b> <%=transit[i].getTimeStart()%> <br>
                                <b>Прибытие:</b> <%=transit[i].getTimeFinish()%>
                            </td>
                            <td class="idSearch">
                                <b>Склад: <% if (user.user.getPermissionId() == 1) {%><a href="stockInfo.jsp?id=<%=transit[i].getStockId()%>"><% } %>№<%=transit[i].getStockId()%><% if (user.user.getPermissionId() == 1) {%></a><% } %></b>, <%=transit[i].getStockLocation().getFullAddress()%><br>
                                <b>Пункт назначения: </b><%=transit[i].getFinishLocation().getFullAddress()%><br>
                                <b>Опасность пути: </b><%=transit[i].getSafetyName()%>
                            </td>
                            <% if (user.user.getPermissionId() != 2) {%><td><a href="confirmTransportation.jsp?id=<%=transit[i].getId()%>" onclick="return confirmConfirm();"><i class="fa fa-check"></i></a></td><% } %>
                            </tr>
                            <% }}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="h2tab2" style="min-height: 800px;">
                        <div class="gray-bg">
                            <br>
                            <div class="col-lg-2" style="width: 20%">
                                <input type="date" class="form-control searchInput1" style="width: 115%;" >
                                <i class="fa fa-calendar-o form-control-feedback"></i>
                            </div>
                            <div class="col-md-3" style="width: 25%">
                                <select class="form-control searchInput1 region" style="width: 105%; padding: 0; padding-left: 5px" name = "region">
                                    <option>Выберите область</option>
                                    <%for (int i = 0; i < region.length; i++) {%>
                                    <option><%=region[i].getName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-md-3" style="width: 30%">
                                <select class="form-control searchInput1" style="width: 105%; padding: 0; padding-left: 5px" name = "stock">
                                    <option>Выберите склад</option>
                                    <%for (int i = 0; i < stock.length; i++) {%>
                                    <option>№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-md-3" style="width: 25%">
                                <select class="form-control searchInput1" style="width: 100%; padding: 0; padding-left: 5px" name = "stock">
                                    <option>Выберите вид транспорта</option>
                                    <%for (int i = 0; i < transportType.length; i++) {%>
                                    <option><%=transportType[i].getName()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <br><br><br>
                        </div> <br>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th style="width: 1%;"><center>№</center></th>
                                    <th style="width: 20%;">Ресурс</th>
                                    <th style="width: 20%;">Транспорт</th>
                                    <th style="width: 20%;">Время</th>
                                    <th style="width: 39%;">Транспортировка</th>
                                </tr>
                            </thead>
                            <tbody id="searchTable1">
                                <%
                                    for (int i = 0; i < transit.length; i++) if (transit[i].getStatus() == 1) {
                                        Request req = Request.getOne(transit[i].getRequestId());
                                         if (user.user.getPermissionId() != 4 || user.user.getId() == transit[i].getDriverId()){
                                %>
                                <tr>
                                    <td class="idSearch1">
                                    <center><%=transit[i].getId()%></center>
                                    </td>
                                    <td class="idSearch1">
                                        <b>Заявка: <% if (user.user.getPermissionId() == 1) {%><a href="requestInfo.jsp?id=<%=req.getId()%>"><% } %>№<%=req.getId()%><% if (user.user.getPermissionId() == 1) {%></a><% } %><br></b>
                                        <b>Вид: </b><%=req.getRequestTypeName()%><br>
                                        <b>Ресурс: </b><%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%>
                                    </td>
                                    <td class="idSearch1">
                                        <b>Вид:</b> <%=transit[i].getTransportName()%><br>
                                        <b>Номер:</b> <%=transit[i].getTransportNumber()%><br>
                                        <b>Водитель: </b><% if (user.user.getPermissionId() == 1) {%><a href="userInfo.jsp?id=<%=transit[i].getDriverId()%>"><% } %><%=transit[i].getDriverName()%><% if (user.user.getPermissionId() == 1) {%></a><% } %><br>
                                    </td>
                                    <td class="idSearch1">
                                        <b>Дата:</b> <%=req.getDateString()%> <br>
                                        <b>Отправление:</b> <%=transit[i].getTimeStart()%> <br>
                                        <b>Прибытие:</b> <%=transit[i].getTimeFinish()%>
                                    </td>
                                    <td class="idSearch1">
                                        <b>Склад: <% if (user.user.getPermissionId() == 1) {%><a href="stockInfo.jsp?id=<%=transit[i].getStockId()%>"><% } %>№<%=transit[i].getStockId()%><% if (user.user.getPermissionId() == 1) {%></a><% } %></b>, <%=transit[i].getStockLocation().getFullAddress()%><br>
                                        <b>Пункт назначения: </b><%=transit[i].getFinishLocation().getFullAddress()%><br>
                                        <b>Опасность пути: </b><%=transit[i].getSafetyName()%>
                                    </td>
                                </tr>
                            <% }}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</center>
<% }%>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>
