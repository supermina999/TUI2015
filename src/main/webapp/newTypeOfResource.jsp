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
        <center><h2 class="title">Добавить вид ресурса</h2></center>
        <hr>
        <form class="form-horizontal" method="post" action="addTypeOfResource.jsp">
                <div class="form-group">
                        <label class="col-sm-3 control-label">Наименование</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="name"Q>
                        </div>
                </div>
                <div class="form-group">
                        <label class="col-sm-3 control-label">Вес</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="weight">
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