<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int minPermission = 8;
    int tab = 7;
%>
<%@include file = "layout1.jsp"%>
<%
    Region[] region = Region.getAll(null);
    Permission[] permission = Permission.getAll(null);
%>
<br>
<div class="form-block center-block">
    <center><h2 class="title">Регистрация</h2></center>
    <form class="form-horizontal" method="post" action="addUser.jsp">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Логин </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="login" required>
                <i class="fa fa-user form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Пароль </label>
            <div class="col-sm-8" id="divPass1">
                <input type="password" class="form-control" name="password1" id="password1" required>
                <i class="fa fa-lock form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Повторите пароль </label>
            <div class="col-sm-8" id="divPass2">
                <input type="password" class="form-control" name="password2" id="password2" required>
                <i class="fa fa-lock form-control-feedback"></i>
            </div>
        </div> <br>

        
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Должность</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="permission_id">
                    <option value="-1">Выберите должность</option>
                    <%for (int i = 0; i < permission.length; i++) {%>
                    <option value="<%=permission[i].getId()%>"><%=permission[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>

        <br>

        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Фамилия </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="surname" required>
                <i class="fa fa-pencil form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Имя </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="name" required>
                <i class="fa fa-pencil form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Отчество </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="second_name" required>
                <i class="fa fa-pencil form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Дата рождения</label>
            <div class="col-sm-8">
                <input type="date" class="form-control" name="birthday" style="padding-right: 0" required>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Область</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="region_id">
                    <option value="-1">Выберите область</option>
                    <%for (int i = 0; i < region.length; i++) {%>
                    <option value="<%=region[i].getId()%>"><%=region[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Город</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" required name="city">
                <i class="fa fa-map-marker form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Адрес</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" required name="address">
                <i class="fa fa-map-marker form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Email </label>
            <div class="col-sm-8">
                <input type="email" class="form-control" name="email" required>
                <i class="fa fa-envelope form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Телефон </label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="phone" required>
                <i class="fa fa-phone form-control-feedback"></i>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">
                <input class="btn btn-block btn-default" type="submit" name="submit" value="Готово">
            </div>
        </div>
    </form>
</div>
<script src="js/checker.js"></script>
<%@include file = "layout2.jsp"%>