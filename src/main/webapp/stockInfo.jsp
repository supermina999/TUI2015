<%@page import="fileXLS.MakeFileXLS"%>
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
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 5) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    String s = request.getParameter("id");
    Stock stock = new Stock();
    Transport[] transport = null;
    TransportType[] transportType = TransportType.getAll(null);
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    DBEntry[] params = {
        new DBEntry("stock_id", EntryType.Int, Integer.parseInt(s))
    };
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<% } else {
        stock = Stock.getOne(Integer.parseInt(s));
        availableRes = AvailableResource.getAll(params);
        transport = Transport.getAll(params);
        if (stock.getPersonId() != user.user.getId() && user.user.getPermissionId() != 1) {%>
              <%@include file = "wrongPermission.jsp"%>
        <%} else {
        History[] history = History.getAll(params);
        if (history.length > 0)
        {
            MakeFileXLS mfXLS = new MakeFileXLS();
            mfXLS.makeFile(-1, Integer.parseInt(s));
        }
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить склад?")) {
            return true;
        } else {
            return false;
        }
    }
    function confirmDelete2() {
        if (confirm("Вы уверены, что хотите удалить ресурс в наличии?")) {
            return true;
        } else {
            return false;
        }
    }
    function confirmDelete3() {
        if (confirm("Вы уверены, что хотите удалить транспортное средтво?")) {
            return true;
        } else {
            return false;
        }
    }
</script>

<br>
<div class="form-block center-block" style="width: 70%;">
    <div style="margin-left: 90%;" <% if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 3) {%> hidden <% } %>>
        <p style="font-size: 25px;"><a href="changeStockInfo.jsp?id=<%=stock.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteStock.jsp?id=<%=stock.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Склад № <%=Integer.parseInt(s)%></h2></center>
    <hr>
    <div class="text-center">
        <a style="width: 30%;" href="newResource.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить ресурс</a>
        <a style="width: 30%;" href="newTransport.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить транспорт</a>
    </div>
    <hr>
    <div class="form-group col-sm-12">
        <p style="font-size: 20px; margin-bottom: 0"> <b>Расположение:</b> <%=stock.getFullAddress()%> </p>
        <p style="font-size: 20px;"> <b>Заведующий:</b> <a href="userInfo.jsp?id=<%=stock.getPersonId()%>"><%=stock.getFullPersonName()%></a> </p>
        <%if (history.length > 0) {%><p style="font-size: 20px;"> <a href="/stockId<%=Integer.parseInt(s)%>.xls" download="stockId<%=Integer.parseInt(s)%>.xls">Скачать отчет о изменениях на складе</a> </p><%}%>
    </div>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="glyphicon glyphicon-list-alt"></i> Ресурсы в наличии</a></li>
            <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-truck"></i> Транспорт</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 1200px;">
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
                            <th style="width: 70%;">Название</th>
                            <th style="width: 20%;">Количество</th> 
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%
                            for (int i = 0; i < availableRes.length; i++) {%>
                        <tr>
                            <td><% if (user.user.getPermissionId() == 1) {%><a href="resourceInfo.jsp?id=<%=availableRes[i].getId()%>&stock_id=<%=Integer.parseInt(s)%>"><% } %> <%=availableRes[i].getResourceName()%><% if (user.user.getPermissionId() == 1) {%></a><% } %></td>
                            <td><%=availableRes[i].getNumber()%> <%=availableRes[i].getMeasureName()%></td>      
                            <td><a href="changeResource.jsp?id=<%=availableRes[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteAvailableResource.jsp?id=<%=availableRes[i].getId()%>" onclick="return confirmDelete2();"><i class="fa fa-close"></i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane" id="h2tab2" style="min-height: 1200px;">
                <div class="form-group has-feedback" style="width: 100%; min-height: 1200px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8" style="width: 69%">
                        <input type="text" class="form-control searchInputText1" placeholder="Поиск" style="width: 105%;">
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4" style="width: 30%; margin-left: 5px;">
                        <select class="form-control searchInput1" style="width: 100%; padding: 0; padding-left: 5px;" name = "transport_type">
                            <option>Выберите вид транспорта</option>
                            <%for (int i = 0; i < transportType.length; i++) {%>
                            <option><%=transportType[i].getName()%></option>
                            <%}%>
                        </select>
                    </div><br><br><br>
                </div> <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%">№</th>
                            <th style="width: 25%;">Вид транспорта</th>
                            <th style="width: 20%;">Характеристики</th>
                            <th style="width: 10%;">Номер</th>
                            <th style="width: 30%;">Водитель</th>
                            <th style="width: 5%"></th>
                            <th style="width: 5%"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable1">
                        <%
                    for (int i = 0; i < transport.length; i++) {%>
                        <tr>
                            <td class="idSearch1"><%if (user.user.getPermissionId() == 1) {%><a href="transportInfo.jsp?<%=transport[i].getId()%>"><% } %><%=transport[i].getId()%><%if (user.user.getPermissionId() == 1) {%></a><% } %></td>
                            <td class="idSearch1">
                                <%=transport[i].getName()%>
                            </td>
                            <td class="idSearch1">
                                <b>Скорость:</b> <%=transport[i].getSpeed()%> км/ч <br> 
                                <b>Вместимость:</b> <%=transport[i].getMaxWeight()%> т 
                            </td>
                            <td class="idSearch1"><%=transport[i].getNumber()%></td>
                            <td class="idSearch1"><%if (user.user.getPermissionId() == 1) {%><a href="userInfo.jsp?id=<%=transport[i].getPersonId()%>"><% } %><%=transport[i].getDriverName()%><%if (user.user.getPermissionId() == 1) {%></a><% } %></td>
                            <td><a href="changeTransportInfo.jsp?id=<%=transport[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteTransport.jsp?id=<%=transport[i].getId()%>" onclick="return confirmDelete3();"><i class="fa fa-close"></i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            </div>        
        </div>
    </div>
</div>
<br>
<% }}} %>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>