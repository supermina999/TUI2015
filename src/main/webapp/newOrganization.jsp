<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 0;
   %>
<%@include file = "layout1.jsp"%>
<br>
<div class="form-block center-block" style="min-height: 700px;">
    <center><h2 class="title">Добавить организацию</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="addOrganization.jsp">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Название</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="name" required>
                <i class="fa fa-pencil form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Адрес</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="address" required>
                <i class="fa fa-map-marker form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Вебсайт</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="website">
                <i class="fa fa-globe form-control-feedback"></i>
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