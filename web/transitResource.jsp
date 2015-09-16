<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Перевезти ресурс</h2></center>
        <hr>
        <form class="form-horizontal">
                <div class="form-group">
                        <label class="col-sm-3 control-label">Наименование</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="name" required>
                        </div>
                </div>
                <div class="form-group">
                        <label class="col-sm-3 control-label">Количество</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="number" required>
                        </div>
                </div>
                <center><h3 class="title">Место отправления:</h3></center>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Город</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;">
                                    <option>Выберите город</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                           </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Склад</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;">
                                    <option>Выберите склад</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                           </select>
                    </div>
                </div>
                
                <center><h3 class="title">Место получения:</h3></center>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Город</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;">
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
                        <select class="form-control" style="width: 100%;">
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