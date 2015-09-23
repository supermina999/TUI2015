<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 4; %>
<%@include file = "layout1.jsp"%>
<%
    DBModel.init();
    Organization[] organization = Organization.getAll(null);
    Stock[] stock = Stock.getAll(null);
    Location[] location = Location.getAll(null);
    City[] city = City.getAll(null);
%>
        <center>
            <br><h1>Склады</h1><br>
                <div class="form-group has-feedback" style="width: 60%;">
                    <div class="gray-bg">
                        <br>
                        <div class="col-md-4">
                            <input type="text" class="form-control" placeholder="Номер" style="width: 105%;" name="id" id="searchInput">
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;" name="city">
                                    <option>Выберите город</option>
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                    <option value="<%=city[i].getId()%>"><%=city[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;" name="organization">
                                    <option>Выберите организацию</option>
                                    <%for (int i = 0; i < organization.length; i++)
                                    {%>
                                    <option value="<%=organization[i].getId()%>"><%=organization[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                            
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table table-bordered">
                            <thead>
                                    <tr>
                                        <th style="width: 30%;">Номер</th>
                                            <th style="width: 30%;">Организация</th>
                                            <th style="width: 40%;">Местоположение</th>
                                    </tr>
                            </thead>
                            <tbody id="stockTable">
                                    <%for (int i = 0; i < stock.length; i++)
                                    {%>
                                        <tr>
                                                <td><%=i + 1%></td>
                                                <td><a href="organizationInfo.jsp?id=<%=organization[stock[i].getOrganizationId()-1].getId()%>"><%=organization[stock[i].getOrganizationId()-1].getName()%></a></td>
                                                <td><%=location[stock[i].getLocationId()-1].getAddress()%>, <%=city[location[stock[i].getLocationId() - 1].getCityId() - 1].getName()%></td>
                                        </tr>
                                    <%}%>
                            </tbody>
                        </table>
                    <a href="newStock.jsp" class="btn btn-default btn-lg">Добавить склад</a>
                </div>
        </center>
<script src="js/searchStock.js"></script>
<%@include file = "layout2.jsp"%>
