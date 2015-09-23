<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<%
    String stock_id = request.getParameter("id");
    String city_id = request.getParameter("city");
    String organization_id = request.getParameter("organization");
    Stock[] stock = Stock.getAll(null);
    Organization[] organization = Organization.getAll(null);
    Location[] location = Location.getAll(null);
    
%>
        <center>
            <br><h1>Склады</h1><br>
                <div class="form-group has-feedback" style="width: 60%;">
                    <table class="table table-bordered">
                            <thead>
                                    <tr>
                                        <th style="width: 30%;">Номер</th>
                                            <th style="width: 30%;">Организация</th>
                                            <th style="width: 40%;">Местоположение</th>
                                    </tr>
                            </thead>
                            <tbody>
                                    <%for (int i = 0; i < stock.length; i++)
                                    {%>
                                        <tr>
                                                <td><%=i + 1%></td>
                                                <td><%=organization[stock[i].getOrganizationId()-1].getName()%></td>
                                                <td><%=location[stock[i].getLocationId()-1].getAddress()%>, <%=city[location[stock[i].getLocationId() - 1].getCityId() - 1].getName()%></td>
                                        </tr>
                                    <%}%>
                            </tbody>
                        </table>
                </div>
    <script>
        window.location.href = "stocks.jsp";
    </script>

<%@include file = "layout2.jsp"%>
