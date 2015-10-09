<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
    String s = request.getParameter("resourceId");
    int id = Integer.parseInt(s);
    Resource resource = new Resource();
    resource = Resource.getOne(id);
%>
<br>
    <div class="form-block center-block" style="min-height: 700px;">
        <center><h2 class="title">Изменить вид ресурса</h2></center>
        <hr>
        <form class="form-horizontal" method="post" action="updateTypeOfResource.jsp?resourceId=<%=id%>">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Наименование</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="name" value="<%=resource.getName()%>" required>
                            <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Вес</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="weight" value="<%=resource.getWeight()%>" required>
                            <i class="fa fa-pencil form-control-feedback"></i>
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