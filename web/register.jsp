<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Регистрация</h2></center>
        <form class="form-horizontal" role="form">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Логин </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="login" required>
                                <i class="fa fa-user form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Пароль </label>
                        <div class="col-sm-8">
                                <input type="password" class="form-control" id="password1" required>
                                <i class="fa fa-lock form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Повторите пароль </label>
                        <div class="col-sm-8">
                                <input type="password" class="form-control" id="password2" required>
                                <i class="fa fa-lock form-control-feedback"></i>
                        </div>
                </div> <br>
                
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Фамилия </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="surname" required>
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Имя </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="name" required>
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Отчество </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="secondName" required>
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Email </label>
                        <div class="col-sm-8">
                                <input type="email" class="form-control" id="inputEmail" required>
                                <i class="fa fa-envelope form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Телефон </label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="phone" required>
                                <i class="fa fa-phone form-control-feedback"></i>
                        </div>
                </div>
                
                <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">
                                <button type="submit" class="btn btn-block btn-default">Готово</button>
                        </div>
                </div>
            
            </form>
        </div>
<%@include file = "layout2.jsp"%>