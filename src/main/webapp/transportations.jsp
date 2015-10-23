<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 3;
%>
<%@include file = "layout1.jsp"%>
<%
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    Region[] region = Region.getAll(null);
    Stock[] stock = Stock.getAll(null);
    Transport[] transport = Transport.getAll(null);
    Transportation[] transit = Transportation.getAll(null);
%>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 800px;">
        <center>
            <h1>Перевозки</h1><br> </center>
        <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
            <div class="gray-bg">
                <br>
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
                <div class="col-md-4">
                    <select class="form-control searchInput" style="width: 100%; padding-left: 5px" name = "stock">
                        <option>Выберите транспорт</option>
                        <%for (int i = 0; i < transport.length; i++) {%>
                        <option><%=transport[i].getName()%></option>
                        <%}%>
                    </select>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 5%;">Номер</th>
                        <th style="width: 40%;">Заявка</th>
                        <th style="width: 55%;">Транспорт</th>
                    </tr>
                </thead>
                <tbody id="searchTable">
                <%
                        for (int i = 0; i < transit.length; i++) {
                        Request req = Request.getOne(transit[i].getRequestId());
                        Application app = Application.getOne(req.getApplicationId());%>
                <tr>
                        <td class="idSearch"><center><%=transit[i].getId()%></center></td>
                        <td class="idSearch">
                            <b>Вид:</b> <%=req.getRequestTypeName()%><br>
                            <b>Ресурс:</b> <%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%><br>
                            <b>Местоположение:</b> <%=req.getLocation().getAddress()%> <%=req.getLocation().getRegionName()%><br>
                            <b>Дата:</b> <%=req.getDateString()%><br>
                            <b>ФИО: </b><%=app.getFullName()%><br>
                            <b>Телефон: </b> <%=app.getPhone()%> <br>
                            <b> Email: </b> <%=app.getEmail()%> <br>
                        </td>
                        <td class="idSearch">
                            <%=transit[i].getTransportId()%>
                        </td>
                </tr>
                <% }%>
                </tbody>
            </table>
        </div>
    </div>
</center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>
