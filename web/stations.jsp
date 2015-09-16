<%@page import="models.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 5; %>
<%@include file = "layout1.jsp"%>
<%
    DBModel.init();
    Station[] station = Station.getAll(null);
    City[] city = City.getAll(null);
    Organization[] organization = Organization.getAll(null);
    Location[] location = Location.getAll(null);
%>
        <center>
            <br><h1>Пункты выдачи</h1><br>
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
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                        <option><%=city[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;">
                                    <option>Выберите организацию</option>
                                    <%for (int i = 0; i < organization.length; i++)
                                    {%>
                                        <option><%=organization[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <br><br><br>
                    </div> <br>
                        <table class="table table-bordered">
                        <thead>
                                <tr>
                                    <th style="width: 25%;">Номер</th>
                                        <th style="width: 50%;">Организация</th>
                                        <th style="width: 25%;">Местоположение</th>
                                </tr>
                        </thead>
                        <tbody>
                                <%for (int i = 0; i < station.length; i++)
                                {%>
                                    <tr>
                                            <td class="quantity"><%=i + 1%></td>
                                            <td class="product"><%=organization[station[i].getOrganizationId()]%></td>
                                            <td class="amount"><%=location[station[i].getLocationId()]%></td>
                                    </tr>
                                <%}%>
                        </tbody>
                        </table>
                    <a href="newStation.jsp" class="btn btn-default btn-lg">Добавить пункт выдачи</a>
                </div>
        </center>
<%@include file = "layout2.jsp"%>
