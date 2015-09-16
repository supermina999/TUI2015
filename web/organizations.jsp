<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 2; %>
<%@include file = "layout1.jsp"%>
        <center>
            <br><h1>Организации</h1><br>
                <div class="form-group has-feedback" style="width: 60%;">
                    <div class="gray-bg">
                        <br>
                        <div class="col-md-8">
                            <input type="text" class="form-control" placeholder="Название" style="width: 105%;">
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;">
                                    <option>Выберите город</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                            </select>
                        </div>
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table table-bordered">
                        <thead>
                                <tr>
                                    <th style="width: 25%;">Название</th>
                                        <th style="width: 50%;">Местоположение</th>
                                        <th style="width: 25%;">Вебсайт</th>
                                </tr>
                        </thead>
                        <tbody>
                            <%
                            DBModel.init();
                            Organization[] org = Organization.getAll(null);
                            for (int i = 0; i < org.length; i++) {%>
                                <tr>
                                        <td class="quantity"> <%=org[i].getName()%></td>
                                        <td class="product"><%=org[i].getAddress()%></td>
                                        <td class="amount"><%=org[i].getWebsite()%></td>
                                </tr>
                                <% } %>
                        </table>
                    <a href="addOrganization.jsp" class="btn btn-default btn-lg">Добавить организацию </a>
                    <a href="register.jsp" class="btn btn-default btn-lg">Добавить волонтера </a>
                </div>
        </center>
<%@include file = "layout2.jsp"%>
