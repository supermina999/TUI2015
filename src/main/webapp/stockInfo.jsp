<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 4;
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
    }
%>
<%@include file = "layout1.jsp"%>
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
</script>

<br>
<div class="form-block center-block" style="width: 70%;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeStockInfo.jsp?id=<%=stock.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteStock.jsp?id=<%=stock.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Склад № <%=Integer.parseInt(s)%></h2></center>
    <hr>
    <div class="form-group col-sm-12">
        <p style="font-size: 20px;"> <b>Расположение:</b> <%=stock.getFullAddress()%> </p>
    </div>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="glyphicon glyphicon-list-alt"></i> Ресурсы в наличии</a></li>
            <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-truck"></i> Транспорт</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 800px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-11" style="width: 98%">
                        <input type="text" class="form-control searchInput" placeholder="Поиск" style="width: 102%;">
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
                            <td><a href="resourceInfo.jsp?id=<%=availableRes[i].getId()%>&stock_id=<%=Integer.parseInt(s)%>"> <%=availableRes[i].getResourceName()%></a></td>
                            <td><%=availableRes[i].getNumber()%> <%=availableRes[i].getMeasureName()%></td>      
                            <td><a href="changeResource.jsp?id=<%=availableRes[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteAvailableResource.jsp?id=<%=availableRes[i].getId()%>" onclick="return confirmDelete2();"><i class="fa fa-close"></i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane" id="h2tab2" style="min-height: 800px;">
                <div class="form-group has-feedback" style="width: 100%; min-height: 800px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8" style="width: 69%">
                        <input type="text" class="form-control searchInput" placeholder="Поиск" style="width: 105%;">
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4" style="width: 30%; margin-left: 5px;">
                        <select class="form-control searchInput" style="width: 100%; padding: 0; padding-left: 5px;" name = "transport_type">
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
                            <td class="idSearch1"><%=transport[i].getId()%></td>
                            <td class="idSearch1">
                                <%=transport[i].getName()%>
                            </td>
                            <td class="idSearch1">
                                <b>Скорость:</b> <%=transport[i].getSpeed()%> км/ч <br> 
                                <b>Вместимость:</b> <%=transport[i].getMaxWeight()%> т 
                            </td>
                            <td class="idSearch1"><%=transport[i].getNumber()%></td>
                            <td class="idSearch1"><a href="userInfo.jsp?id=<%=transport[i].getPersonId()%>"><%=transport[i].getDriverName()%></a></td>
                            <td><a href="changeTransportInfo.jsp?id=<%=transport[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteTransport.jsp?id=<%=transport[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
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
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>