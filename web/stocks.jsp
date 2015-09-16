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
%>
        <center>
            <br><h1>Склады</h1><br>
                <div class="form-group has-feedback" style="width: 60%;">
                    <div class="gray-bg">
                        <br>
                        <div class="col-md-8">
                            <input type="text" class="form-control" placeholder="Название" style="width: 105%;">
                            <i class="fa fa-search form-control-feedback"></i>
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
                    </div>
                    <br>
                        <table class="table table-bordered">
                            <thead>
                                    <tr>
                                        <th style="width: 25%;">Название</th>
                                            <th style="width: 50%;">Организация</th>
                                            <th style="width: 25%;">Местоположение</th>
                                    </tr>
                            </thead>
                            <tbody>
                                    <%for (int i = 0; i < stock.length; i++)
                                    {%>
                                        <tr>
                                                <td class="quantity"><%=i + 1%></td>
                                                <td class="product"><%=organization[stock[i].getOranizationId()]%></td>
                                                <td class="amount"><%=location[stock[i].getLocationId()]%></td>
                                        </tr>
                                    <%}%>
                            </tbody>
                        </table>
                    <a href="newStock.jsp" class="btn btn-default btn-lg">Добавить склад</a>
                </div>
        </center>
<%@include file = "layout2.jsp"%>
