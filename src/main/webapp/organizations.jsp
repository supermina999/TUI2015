<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 2; %>
<%@include file = "layout1.jsp"%>
<%
    Organization[] organization = Organization.getAll(null);
    City[] city = City.getAll(null);
%>
        <center>
            <br><h1>Организации</h1><br>
                <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
                    <div class="gray-bg">
                        <br>
                        <div class="col-md-8">
                            <input type="text" class="form-control searchInput" placeholder="Поиск" style="width: 105%;">
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;">
                                    <option>Выберите город</option>
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                        <option><%=city[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table">
                        <thead>
                                <tr>
                                    <th style="width: 25%;">Название</th>
                                    <th style="width: 40%;">Местоположение</th>
                                    <th style="width: 25%;">Вебсайт</th>
                                    <th style="width: 5%;"></th>
                                    <th style="width: 5%;"></th>
                                </tr>
                        </thead>
                        <tbody id="searchTable">
                            <% for (int i = 0; i < organization.length; i++) 
                                {%>
                                <tr>
                                    <td class="idSearch"><a href ="organizationInfo.jsp?id=<%=organization[i].getId()%>"><%=organization[i].getName()%></a></td>
                                    <td><%=organization[i].getAddress()%></td>
                                    <td><%=organization[i].getWebsite()%></td>
                                    <td><a href="changeOrganizationInfo.jsp?id=<%=organization[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                                    <td><a href="deleteOrganization.jsp?id=<%=organization[i].getId()%>"><i class="fa fa-close"></i></a></td>
                                </tr>
                                <% } %>
                        </table>
                    <a href="newOrganization.jsp" class="btn btn-default btn-lg">Добавить организацию </a>
                    <a href="register.jsp" class="btn btn-default btn-lg">Добавить волонтера </a>
                </div>
        </center>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>
