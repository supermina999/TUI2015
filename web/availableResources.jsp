<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    City[] city = City.getAll(null);
    Stock[] stock = Stock.getAll(null);
%>
    <center>
        <br><h1>Ресурсы в наличии</h1><br>
        <div class="form-group has-feedback" style="width: 60%;">
            <div class="gray-bg">
                <br>
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="Название" style="width: 105%;" id="searchIdInput">
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 105%;" name = "city">
                            <option>Выберите город</option>
                            <%for (int i = 0; i < city.length; i++)
                            {%>
                                <option><%=city[i].getName()%></option>
                            <%}%>
                    </select>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 100%;" name = "stock">
                            <option>Выберите склад</option>
                            <%for (int i = 0;i < stock.length;i++)
                            {%>
                                <option>№<%=stock[i].getId()%>, <%=stock[i].getLocation().getAddress()%></option>
                            <%}%>
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
                <tbody id="searchTable">
                    <%
                    for (int i = 0; i < availableRes.length; i++) {%>
                    <tr>
                        <td class="quantity idSearch"> <%= availableRes[i].getResourceName() %> </td>
                            <td class="product"><%= availableRes[i].getNumber() %></td>
                            <td class="amount"><%=availableRes[i].getLocation().getCityName()%></td>
                            <td class="product"><%=availableRes[i].getLocation().getAddress()%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        
        <a href="newResource.jsp" class="btn btn-default btn-lg">Добавить ресурс </a>
        <a href="transitResource.jsp" class="btn btn-default btn-lg">Перевезти ресурс</a>
            
        </div>
    </center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>
