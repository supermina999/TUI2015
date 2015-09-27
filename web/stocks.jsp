<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 4; %>
<%@include file = "layout1.jsp"%>
<%
    Organization[] organization = Organization.getAll(null);
    Stock[] stock = Stock.getAll(null);
    City[] city = City.getAll(null);
%>
        <center>
            <br><h1>Склады</h1><br>
                <div class="form-group has-feedback" style="width: 60%;">
                    <div class="gray-bg">
                        <br>
                        <div class="col-md-4">
                            <input type="text" class="form-control searchInput" placeholder="Номер" style="width: 105%;" >
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control searchInput city" style="width: 105%;" name="city">
                                    <option>Выберите город</option>
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                    <option value="<%=city[i].getName()%>"><%=city[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control searchInput" style="width: 130%;" name="organization">
                                    <option>Выберите организацию</option>
                                    <%for (int i = 0; i < organization.length; i++)
                                    {%>
                                    <option value="<%=organization[i].getName()%>"><%=organization[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                            <div class="col-md-1">
                                <i class="fa fa-search form-control-feedback"></i>
                            </div>
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table table-bordered">
                            <thead>
                                    <tr>
                                        <th style="width: 10%;">Номер</th>
                                            <th style="width: 40%;">Организация</th>
                                            <th style="width: 50%;">Местоположение</th>
                                    </tr>
                            </thead>
                            <tbody id="searchTable">
                                    <%for (int i = 0; i < stock.length; i++)
                                    {%>
                                        <tr>

                                                <td><center><a href="stockInfo.jsp?id=<%=stock[i].getId()%>"><%=i + 1%></a></center></td>
                                                <td><a href="organizationInfo.jsp?id=<%=stock[i].getOrganizationId()%>"><%=stock[i].getOrganizationName()%></a></td>
                                                <td><%=stock[i].getLocation().getAddress()%>, <%=stock[i].getLocation().getCityName()%>, <%=stock[i].getLocation().getCountryName()%></td>
                                        </tr>
                                    <%}%>
                            </tbody>
                        </table>
                    <a href="newStock.jsp" class="btn btn-default btn-lg">Добавить склад</a>
                </div>
        </center>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>
