<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 3;
%>
<%@include file = "layout1.jsp"%>
<%
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    Region[] region = Region.getAll(null);
    Stock[] stock = Stock.getAll(null);
%>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 800px;">
        <div style="margin-left: 47%;">
            <p><a href="newResource.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить ресурс</a></p>
        </div>
        <center>
            <h1>Ресурсы в наличии</h1><br> </center>
            <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-4">
                        <input type="text" class="form-control searchInput" placeholder="Название" style="width: 105%;">
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput region" style="width: 105%;" name = "region">
                            <option>Выберите область</option>
                            <%for (int i = 0; i < region.length; i++) {%>
                            <option><%=region[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput" style="width: 100%; padding-left: 5px" name = "stock">
                            <option>Выберите склад</option>
                            <%for (int i = 0; i < stock.length; i++) {%>
                            <option>№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                </div> <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 40%;">Название</th>
                            <th style="width: 50%;">Склад</th>
                            <th style="width: 10%;">Количество</th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%
                    for (int i = 0; i < availableRes.length; i++) {%>
                        <tr>
                            <td class="idSearch"><a href="resourceInfo.jsp?id=<%=availableRes[i].getId()%>&stock_id=-1"><%=availableRes[i].getResourceName()%> </a></td>
                            <td class="idSearch"><a href="stockInfo.jsp?id=<%=availableRes[i].getStockId()%>">№<%=availableRes[i].getStockId()%></a>, <%=availableRes[i].getLocation().getAddress()%>, <%=availableRes[i].getLocation().getRegionName()%>, <%=availableRes[i].getLocation().getCountryName()%> </td>
                            <td class="idSearch"><%=availableRes[i].getNumber()%> <%=availableRes[i].getMeasureName()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
    </div>
</center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>
