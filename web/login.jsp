<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block">
        <center><h2 class="title">Авторизация</h2></center>
        <hr>
        <form class="form-horizontal">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Логин</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" id="login" required>
                                <i class="fa fa-user form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Пароль</label>
                        <div class="col-sm-8">
                                <input type="password" class="form-control" id="password"required>
                                <i class="fa fa-lock form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">
                                <div class="checkbox">
                                        <label>
                                                <input type="checkbox"> Запомнить меня
                                        </label>
                                </div>											
                                <button type="submit" class="btn btn-group btn-default btn-block">Вход</button>
                        </div>
                </div>
        </form>
</div>


<%@include file = "layout2.jsp"%>