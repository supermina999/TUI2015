<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
    <center>
        <br><h1>Требующиеся ресурсы</h1><br>
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
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 100%;">
                            <option>Выберите пункт выдачи</option>
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
                        <th style="width: 25%;">Пункт выдачи</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        DBModel.init();
                        NeededResource[] neededRes = NeededResource.getAll(null); 
                        for (int i = 0; i < neededRes.length; i++) {%>
                        <tr>
                            <td class="quantity"> <%=neededRes[i].getResourceId()%></td>
                            <td class="amount"><%=neededRes[i].getNumber()%></td>
                            <td class="product"><%=neededRes[i].getStationId()%></td>
                            <td class="amount"><%=neededRes[i].getStationId()%></td>
                            
                        </tr>
                    <% } %>
                </tbody>
            </table>
        
        <a href="transitResource.jsp" class="btn btn-default btn-lg">Перевезти ресурс</a>
        <a href="newNeededResource.jsp" class="btn btn-default btn-lg">Добавить требующийся ресурс</a>
            
        </div>
    </center>
    
<%@include file = "layout2.jsp"%>
