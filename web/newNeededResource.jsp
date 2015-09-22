<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Добавить требующийся ресурс</h2></center>
        <hr>
        <form class="form-horizontal" method="post" action="addNeededResource.jsp">
                <div class="form-group">
                        <label class="col-sm-3 control-label">Наименование</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="name">
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
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                           </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Пункт выдачи</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;" name="station">
                                    <option>Выберите пункт выдачи</option>
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