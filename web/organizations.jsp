<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 2; %>
<%@include file = "layout1.jsp"%>
<%
    DBModel.init();
    Organization[] organization = Organization.getAll(null);
    City[] city = City.getAll(null);
%>
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
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                        <option><%=city[i].getName()%></option>
                                    <%}%>
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
                            <% for (int i = 0; i < organization.length; i++) 
                                {%>
                                <tr>
                                    <td class="quantity"><a href ="organizationInfo.jsp?id=<%=i%>"> <%=organization[i].getName()%></a></td>
                                        <td class="product"><%=organization[i].getAddress()%></td>
                                        <td class="amount"><%=organization[i].getWebsite()%></td>
                                </tr>
                                <% } %>
                        </table>
                    <a href="newOrganization.jsp" class="btn btn-default btn-lg">Добавить организацию </a>
                    <a href="register.jsp" class="btn btn-default btn-lg">Добавить волонтера </a>
                </div>
        </center>
<%@include file = "layout2.jsp"%>
