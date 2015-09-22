<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
    DBModel.init();
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    Resource[] resource = Resource.getAll(null);
    Stock[] stock = Stock.getAll(null);
    Location[] location = Location.getAll(null);
    City[] city = City.getAll(null);
%>
    <center>
        <br><h1>Ресурсы в наличии</h1><br>
        <div class="form-group has-feedback" style="width: 60%;">
            <div class="gray-bg">
                <br>
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="Название" style="width: 105%;">
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 105%;">
                            <option>Выберите город</option>
                            <%for (int i = 0; i < city.length; i++)
                            {%>
                                <option><%=city[i].getName()%></option>
                            <%}%>
                    </select>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 100%;">
                            <option>Выберите склад</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 25%;">Название</th>
                        <th style="width: 25%;">Количество</th>
                        <th style="width: 25%;">Город</th>
                        <th style="width: 25%;">Склад</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (int i = 0; i < availableRes.length; i++) {%>
                    <tr>
                            <td class="quantity"> <%=resource[availableRes[i].getResourceId() - 1].getName()%></td>
                            <td class="product"><%=availableRes[i].getNumber()%></td>
                            <td class="amount"><%=city[location[stock[availableRes[i].getStockId() - 1].getLocationId() - 1].getCityId() - 1].getName()%></td>
                            <td class="product"><%=location[stock[availableRes[i].getStockId() - 1].getLocationId() - 1].getAddress()%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        
        <a href="addResource.jsp" class="btn btn-default btn-lg">Добавить ресурс </a>
        <a href="transitResource.jsp" class="btn btn-default btn-lg">Перевезти ресурс</a>
            
        </div>
    </center>
    
<%@include file = "layout2.jsp"%>
