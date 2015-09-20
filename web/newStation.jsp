<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 5; %>
<%@include file = "layout1.jsp"%>
<%
    DBModel.init();
    Organization[] organization = Organization.getAll(null);
    Location[] location = Location.getAll(null);
%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Добавить пункт выдачи</h2></center>
        <hr>
        <form class="form-horizontal" method = "post" action = "addStation.jsp">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Адрес</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="address" style="width: 100%;">
                                    <option>Выберите адрес</option>
                                    <%for (int i = 0; i < location.length; i++)
                                    {%>
                                    <option value="<%=location[i].getId()%>"><%=location[i].getAddress()%></option>
                                    <%}%>
                            </select>
                        </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Организация</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="organization" style="width: 100%;">
                                    <option>Выберите организацию</option>
                                    <%for (int i = 0; i < organization.length; i++)
                                    {%>
                                    <option value="<%=organization[i].getId()%>"><%=organization[i].getName()%></option>
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
