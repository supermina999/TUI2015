<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 5;
%>
<%@include file = "layout1.jsp"%>
<%
    Transport[] transport = Transport.getAll(null);
    TransportType[] transportType = TransportType.getAll(null);
    Region[] region = Region.getAll(null);
    Stock[] stock = Stock.getAll(null);
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить транспортное средство?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 800px;">
        <div style="margin-left: 42%;">
            <p><a href="newTransport.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить транспортное средство</a></p>
        </div>
        <center>
            <h1>Транспортные средства в наличии</h1><br> </center>
            <div class="form-group has-feedback" style="width: 65%; min-height: 800px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-11" style="width: 98%">
                        <input type="text" class="form-control searchInputText" placeholder="Поиск" style="width: 102%;">
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <br><br>
                    <div class="col-md-4" style="width: 31%;">
                        <select class="form-control searchInput region" style="width: 100%; padding: 0; padding-left: 5px;" name = "region">
                            <option>Выберите область</option>
                            <%for (int i = 0; i < region.length; i++) {%>
                            <option><%=region[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="col-md-4" style="width: 39%;">
                        <select class="form-control searchInput" style="width: 100%; padding: 0; padding-left: 5px;" name = "stock">
                            <option>Выберите склад</option>
                            <%for (int i = 0; i < stock.length; i++) {%>
                            <option>№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="col-md-4" style="width: 30%">
                        <select class="form-control searchInput" style="width: 100%; padding: 0; padding-left: 5px;" name = "transport_type">
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
                            <th style="width: 5%">№</th>
                            <th style="width: 25%;">Транспорт</th>
                            <th style="width: 10%;">Номер</th>
                            <th style="width: 20%;">Водитель</th>
                            <th style="width: 30%;">Склад</th>
                            <th style="width: 5%"></th>
                            <th style="width: 5%"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%
                    for (int i = 0; i < transport.length; i++) {%>
                        <tr>
                            <td class="idSearch"><a href="transportInfo.jsp?id=<%=transport[i].getId()%>"><%=transport[i].getId()%></a></td>
                            <td class="idSearch">
                                <b>Вид:</b> <%=transport[i].getName()%><br> 
                                <b>Скорость:</b> <%=transport[i].getSpeed()%> км/ч <br> 
                                <b>Вместимость:</b> <%=transport[i].getMaxWeight()%> т 
                            </td>
                            <td class="idSearch"><%=transport[i].getNumber()%></td>
                            <td class="idSearch"><a href="userInfo.jsp?id=<%=transport[i].getPersonId()%>"><%=transport[i].getDriverName()%></a></td>
                            <td class="idSearch"><a href="stockInfo.jsp?id=<%=transport[i].getStockId()%>">№<%=transport[i].getStockId()%></a>, <%=transport[i].getStockAddress()%></td>
                            <td><a href="changeTransportInfo.jsp?id=<%=transport[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteTransport.jsp?id=<%=transport[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
    </div>
</center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>
