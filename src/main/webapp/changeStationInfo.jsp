<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 5;
   Organization[] organization = Organization.getAll(null);
   Location[] location = Location.getAll(null);
   City[] city = City.getAll(null);
   String s = request.getParameter("id");
   Station station = new Station();
   if (s == null)
   {%>
        <script>
         window.location.href = "index.jsp";
        </script>
    <%} else {
        int i = Integer.parseInt(s);
        station = Station.getOne(i);
   }
%>

<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block" style="width: 50%; min-height: 700px;">
        <center><h2 class="title">Изменить информацию о пункте выдачи</h2></center>
        <hr>
        <form class="form-horizontal" method = "post" action = "updateStationInfo.jsp?id=<%=Integer.parseInt(s)%>">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Адрес</label>
                        <div class="col-sm-4">
                                <input type="text" class="form-control" name="address" value="<%=station.getLocation().getAddress()%>"required>
                                <i class="fa fa-map-marker form-control-feedback"></i>
                        </div>
                        <div class="col-sm-4">
                            <select class="form-control" name="city" style="width: 100%;">
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                    <option value="<%=city[i].getId()%>" <% if (station.getLocation().getCityId() == i+1) {%> selected <% } %>><%=city[i].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Организация</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="organization" style="width: 100%;">
                                    <%for (int i = 0; i < organization.length; i++)
                                    {%>
                                    <option value="<%=organization[i].getId()%>" <% if (station.getOrganizationId() == i+1) {%> selected <% } %>><%=organization[i].getName()%></option>
                                    <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">					
                                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
                        </div>
                </div>
        </form>
    </div>
<%@include file = "layout2.jsp"%>