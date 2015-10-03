<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
   Resource[] recource = Resource.getAll(null);
%>
<br>
    <div class="form-block center-block" style="min-height: 700px;">
        <center><h2 class="title">Изменить вид ресурса</h2></center>
        <hr>
        <form class="form-horizontal" method="post" action="doChangeTypeOfResource.jsp">
                <div class="form-group">
                        <label class="col-sm-3 control-label">Наименование</label>
                        <div class="col-sm-8">
                            <select class="form-control" style="width: 100%;" name="resourceId">
                                <option>Выберите наименование</option>
                                <%for (int i = 0; i < recource.length; i++)
                                {%>
                                <option value="<%=recource[i].getId()%>"><%=recource[i].getName()%></option>
                                <%}%>
                            </select>
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