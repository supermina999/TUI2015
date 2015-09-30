<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
    City[] city = City.getAll(null);
    Stock[] stock = Stock.getAll(null);
%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Добавить ресурс</h2></center>
        <hr>
        <form class="form-horizontal" method="post" action="addResource.jsp">
                <div class="form-group">
                        <label class="col-sm-3 control-label">Наименование</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="name"Q>
                        </div>
                </div>
                <div class="form-group">
                        <label class="col-sm-3 control-label">Количество</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="number">
                        </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Город</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;" name="city"> 
                                    <option>Выберите город</option>
                                    <%for (int i = 0; i < city.length; i++)
                                    {%>
                                        <option><%=city[i].getName()%></option>
                                    <%}%>
                           </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Склад</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;" name="stockId">
                                    <option>Выберите склад</option>
                                    <%for (int i = 0;i < stock.length;i++)
                                    {%>
                                        <option value="<%=stock[i].getId()%>"><%=stock[i].getLocation().getAddress()%></option>
                                    <%}%>
                        </select>
                    </div>
                </div>
            
                <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">
                                <input class="btn btn-block btn-default" type="submit" name="submit" value="Готово">
                        </div>
                </div>
        </form>
</div>


<%@include file = "layout2.jsp"%>