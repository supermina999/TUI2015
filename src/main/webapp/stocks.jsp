<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 4;
%>
<%@include file = "layout1.jsp"%>
<%
    Organization[] organization = Organization.getAll(null);
    Stock[] stock = Stock.getAll(null);
    City[] city = City.getAll(null);
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить склад?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<center>
    <div class="form-group has-feedback center-block" style="width: 60%; min-height: 800px;">
        <div style="margin-left: 80%;">
            <p><a href="newStock.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить склад</a></p>
        </div>
        <center><h1>Склады</h1><br></center>
        <div class="gray-bg">
            <br>
            <div class="col-md-4">
                <input type="text" class="form-control searchInput" placeholder="Поиск" style="width: 105%;" >
                <i class="fa fa-search form-control-feedback"></i>
            </div>
            <div class="col-md-4">
                <select class="form-control searchInput city" style="width: 105%; padding-right: 0;" name="city">
                    <option>Выберите город</option>
                    <%for (int i = 0; i < city.length; i++) {%>
                    <option value="<%=city[i].getName()%>"><%=city[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="col-md-4">
                <select class="form-control searchInput" style="width: 100%; padding-right: 0;" name="organization">
                    <option>Выберите организацию</option>
                    <%for (int i = 0; i < organization.length; i++) {%>
                    <option value="<%=organization[i].getName()%>"><%=organization[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <br><br><br>
        </div>
        <br>
        <table class="table" id="tableBases">
            <thead>
                <tr>
                    <th style="width: 5%;">Номер</th>
                    <th style="width: 40%;">Организация</th>
                    <th style="width: 40%;">Местоположение</th>
                    <th style="width: 5%;"></th>
                    <th style="width: 5%;"></th>
                    <th style="width: 5%;"></th>
                </tr>
            </thead>
            <tbody id="searchTable">
                <%for (int i = 0; i < stock.length; i++) {%>
                <tr>

                    <td class="idSearch" ><center><a href="stockInfo.jsp?id=<%=stock[i].getId()%>"><%=stock[i].getId()%></a></center></td>
            <td><a href="organizationInfo.jsp?id=<%=stock[i].getOrganizationId()%>"><%=stock[i].getOrganizationName()%></a></td>
            <td><%=stock[i].getLocation().getAddress()%>, <%=stock[i].getLocation().getCityName()%>, <%=stock[i].getLocation().getCountryName()%></td>
            <td><a onclick="showPlacemark($(this).closest('td').prev('td').text());"><i class="fa fa-map-marker"></i></a></td> 
            <td><a href="changeStockInfo.jsp?id=<%=stock[i].getId()%>"><i class="fa fa-edit"></i></a></td>
            <td><a href="deleteStock.jsp?id=<%=stock[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>   
            </tr>
            <%}%>
            </tbody>
        </table>
        <div id="map" style="width: 100%; height: 400px"></div>
    </div>
</center>
<script src="js/search.js"></script>
<script src="js/map.js"></script>
<%@include file = "layout2.jsp"%>
