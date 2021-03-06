<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 4;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 4) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    String s = request.getParameter("id");
    Transport transport = new Transport();
    Transportation[] transit = null;
    RequestType[] requestType = RequestType.getAll(null);
    int id = 0;
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<% } else {
        id = Integer.parseInt(s);
        transport = Transport.getOne(id);
        DBEntry[] params = {
            new DBEntry("transport_id", EntryType.Int, Integer.parseInt(s))
        };
        transit = Transportation.getAll(params);
        if (user.user.getId() != transport.getPersonId() && user.user.getPermissionId() != 1) {%>
            <%@include file = "wrongPermission.jsp"%>
        <%} else {
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить транспортное средство?")) {
            return true;
        } else {
            return false;
        }
    }
    function confirmDelete2() {
        if (confirm("Вы уверены, что хотите удалить запланированную перевозку?")) {
            return true;
        } else {
            return false;
        }
    }
    function confirmConfirm() {
        if (confirm("Вы уверены, что хотите подтвердить, что груз успешно доставлен/получен?")) {
            return true;
        } else {
            return false;
        }
    }
</script>

<br>
<div class="form-block center-block" style="width: 70%;">
    <div style="margin-left: 90%;" <% if (user.user.getPermissionId() == 4) {%> hidden <% } %>>
        <p style="font-size: 25px;"><a href="changeTransportInfo.jsp?id=<%=id%>"><i class="fa fa-edit"></i></a>
            <a href="deleteTransport.jsp?id=<%=id%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Транспортное средство № <%=id%></h2></center>
    <hr>
    <div class="form-group col-sm-12">
        <p style="font-size: 20px; margin-bottom: 0"><b>Вид:</b> <%=transport.getName()%></p>
        <p style="font-size: 20px; margin-bottom: 0"><b>Номер:</b> <%=transport.getNumber()%></p>
        <p style="font-size: 20px; margin-bottom: 0"> <b>Склад:</b> <%if (user.user.getPermissionId() == 1) {%><a href="stockInfo.jsp?id=<%=transport.getStockId()%>s"><% } %>№<%=transport.getStockId()%><%if (user.user.getPermissionId() == 1) {%></a><% } %>, 
            <%=transport.getStockAddress()%> </p>
        <p style="font-size: 20px; margin-top: 0"> <b>Водитель:</b> <a href="userInfo.jsp?id=<%=transport.getPersonId()%>"><%=transport.getDriverName()%></a></p>
    </div>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="glyphicon glyphicon-list-alt"></i> План перевозок</a></li>
            <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-truck"></i> Архив перевозок</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 1200px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8">
                        <input type="text" class="form-control searchInputText" placeholder="Поиск" style="width: 105%;" >
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput" style="width: 100%; padding-right: 0;" name="request">
                            <option>Выберите вид заявки</option>
                            <%for (int i = 0; i < requestType.length; i++) {%>
                            <option value="<%=requestType[i].getName()%>"><%=requestType[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%;"><center>№</center></th>
                            <th style="width: 30%;">Ресурс</th>
                            <th style="width: 25%;">Время</th>
                            <th style="width: 35%;">Транспортировка</th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%
                            for (int i = 0; i < transit.length; i++)
                                if (transit[i].getStatus() == 0) {
                                    Request req = Request.getOne(transit[i].getRequestId());
                        %>
                        <tr>
                            <td class="idSearch">
                    <center><%=transit[i].getId()%></center>
                    </td>
                    <td class="idSearch">
                        <b>Заявка: <%if (user.user.getPermissionId() == 1) {%><a href="requestInfo.jsp?id=<%=req.getId()%>"><% } %>№<%=req.getId()%><%if (user.user.getPermissionId() == 1) {%></a><% } %><br></b>
                        <b>Вид: </b><%=req.getRequestTypeName()%><br>
                        <b>Ресурс: </b><%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%>
                    </td>
                    <td class="idSearch">
                        <b>Дата:</b> <%=req.getDateString()%> <br>
                        <b>Отправление:</b> <%=transit[i].getTimeStart()%> <br>
                        <b>Прибытие:</b> <%=transit[i].getTimeFinish()%>
                    </td>
                    <td class="idSearch">
                        <b>Пункт назначения: </b><%=transit[i].getFinishLocation().getFullAddress()%><br>
                        <b>Опасность: </b><%=transit[i].getSafetyName()%><br>
                    </td>
                    <td><a href="confirmTransportation.jsp?id=<%=transit[i].getId()%>" onclick="return confirmConfirm();"><i class="fa fa-check"></i></a></td>
                    </tr>
                    <% }%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane" id="h2tab2" style="min-height: 1200px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8">
                        <input type="text" class="form-control searchInputText1" placeholder="Поиск" style="width: 105%;" >
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput1" style="width: 100%; padding-right: 0;" name="request">
                            <option>Выберите вид заявки</option>
                            <%for (int i = 0; i < requestType.length; i++) {%>
                            <option value="<%=requestType[i].getName()%>"><%=requestType[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%;"><center>№</center></th>
                            <th style="width: 35%;">Ресурс</th>
                            <th style="width: 25%;">Время</th>
                            <th style="width: 35%;">Транспортировка</th>
                        </tr>
                    </thead>
                    <tbody id="searchTable1">
                        <%
                            for (int i = 0; i < transit.length; i++)
                                if (transit[i].getStatus() == 1) {
                                    Request req = Request.getOne(transit[i].getRequestId());
                        %>
                        <tr>
                            <td class="idSearch1">
                    <center><%=transit[i].getId()%></center>
                    </td>
                    <td class="idSearch1">
                        <b>Заявка: <%if (user.user.getPermissionId() == 1) {%><a href="requestInfo.jsp?id=<%=req.getId()%>"><% } %>№<%=req.getId()%><%if (user.user.getPermissionId() == 1) {%></a><% } %><br></b>
                        <b>Вид: </b><%=req.getRequestTypeName()%><br>
                        <b>Ресурс: </b><%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%>
                    </td>
                    <td class="idSearch1">
                        <b>Дата:</b> <%=req.getDateString()%> <br>
                        <b>Отправление:</b> <%=transit[i].getTimeStart()%> <br>
                        <b>Прибытие:</b> <%=transit[i].getTimeFinish()%>
                    </td>
                    <td class="idSearch1">
                        <b>Пункт назначения: </b><%=transit[i].getFinishLocation().getFullAddress()%><br>
                        <b>Опасность: </b><%=transit[i].getSafetyName()%><br>
                    </td>
                    </tr>
                    <% }%>
                    </tbody>
                </table>
            </div>
        </div>        
    </div>
</div>
<br>
<% }}} %>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>