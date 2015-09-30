<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 5; %>
<%@include file = "layout1.jsp"%>
<%
    Station[] station = Station.getAll(null);
    City[] city = City.getAll(null);
    Organization[] organization = Organization.getAll(null);
%>
        <center>
            <br><h1>Пункты выдачи</h1><br>
                <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
                    <div class="gray-bg">
                        <br>
                        <div class="col-md-4">
                            <input type="text" class="form-control searchInput" placeholder="Номер" style="width: 105%;" >
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control searchInput city" style="width: 105%;">
                                    <option>Выберите город</option>
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                        <option><%=city[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control searchInput" style="width: 100%;">
                                    <option>Выберите организацию</option>
                                    <%for (int i = 0; i < organization.length; i++)
                                    {%>
                                        <option><%=organization[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <br><br><br>
                    </div> <br>
                        <table class="table">
                        <thead>
                                <tr>
                                    <th style="width: 10%;">Номер</th>
                                        <th style="width: 40%;">Организация</th>
                                        <th style="width: 40%;">Местоположение</th>
                                        <th style="width: 5%;"></th>
                                        <th style="width: 5%;"></th>
                                </tr>
                        </thead>
                        <tbody id="searchTable">
                                <%for (int i = 0; i < station.length; i++)
                                {%>
                                    <tr>
                                            <td><center><a href="stationInfo.jsp?id=<%=station[i].getId()%>"><%=station[i].getId()%></a></center></td>
                                            <td><a href="organizationInfo.jsp?id=<%=station[i].getOrganizationId()%>"><%=station[i].getOrganizationName()%></a></td>
                                            <td><%=station[i].getLocation().getAddress()%>, <%=station[i].getLocation().getCityName()%>, <%=station[i].getLocation().getCountryName()%></td>
                                            <td><a href="changeStationInfo.jsp?id=<%=station[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                                            <td><a href="deleteStation.jsp?id=<%=station[i].getId()%>"><i class="fa fa-close"></i></a></td>
                                    </tr>
                                <%}%>
                        </tbody>
                        </table>
                    <a href="newStation.jsp" class="btn btn-default btn-lg">Добавить пункт выдачи</a>
                </div>
        </center>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>