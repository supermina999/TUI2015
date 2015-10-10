<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
    NeededResource[] neededRes = NeededResource.getAll(null);
    City[] city = City.getAll(null);
    Station[] station = Station.getAll(null);
%>
    <center>
        <br><h1>Требующиеся ресурсы</h1><br>
        <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
            <div class="gray-bg">
                <br>
                <div class="col-md-4">
                    <input type="text" class="form-control searchInput" placeholder="Название" style="width: 105%;" >
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <div class="col-md-4">
                    <select class="form-control searchInput" style="width: 105%;">
                            <option>Выберите город</option>
                            <%for (int i = 0; i < city.length; i++)
                            {%>
                                <option><%=city[i].getName()%></option>
                            <%}%>
                    </select>
                </div>
                <div class="col-md-4">
                    <select class="form-control searchInput" style="width: 100%;">
                            <option>Выберите пункт выдачи</option>
                            <%for (int i = 0;i < station.length;i++)
                            {%>
                                <option>№<%=station[i].getId()%>, <%=station[i].getLocation().getAddress()%></option>
                            <%}%>
                    </select>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 40%;">Название</th>
                        <th style="width: 50%;">Пункт выдачи</th>
                        <th style="width: 10%;">Количество</th>
                    </tr>
                </thead>
                <tbody id="searchTable">
                    <%
                    for (int i = 0; i < neededRes.length; i++) {%>
                    <tr>
                        <td class="idSearch"><%=neededRes[i].getResourceName() %> </td>
                        <td class="idSearch">№<%=neededRes[i].getBaseId()%>, <%=neededRes[i].getLocation().getAddress()%>, <%=neededRes[i].getLocation().getCityName()%>, <%=neededRes[i].getLocation().getCountryName()%> </td>
                        <td class="idSearch"><%=neededRes[i].getNumber()%> <%=neededRes[i].getMeasureName()%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        
        <a href="transitResource.jsp" class="btn btn-default btn-lg">Перевезти ресурс</a>
        <a href="newNeededResource.jsp" class="btn btn-default btn-lg">Добавить требующийся ресурс</a>
        </div>
    </center>
<script src="js/search.js"></script>     
<%@include file = "layout2.jsp"%>
