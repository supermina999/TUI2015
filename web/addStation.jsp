<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Добавить пункт выдачи</h2></center>
        <hr>
        <form class="form-horizontal">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Название</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="name" required>
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Адрес</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="address" required>
                                <i class="fa fa-map-marker form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Организация</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;">
                                    <option>Выберите организацию</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
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
