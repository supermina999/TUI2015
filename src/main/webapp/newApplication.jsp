<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 2;
    RequestType[] requestType = RequestType.getAll(null);
    Region[] region = Region.getAll(null);
%>
<%@include file = "layout1.jsp"%>
<br>
<div class="form-block center-block" style="min-height: 1000px;">
    <center><h2 class="title">Оставить заявку</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="addApplication.jsp">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Вид заявки</label>
            <div class="col-sm-8">
                <select class="form-control" name="request" id="request" style="width: 100%; padding-right: 0">
                    <option selected>Выберите вид заявки</option>
                    <%for (int i = 0; i < requestType.length; i++) {%>
                    <option value="<%=requestType[i].getId()%>"><%=requestType[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Содержание <br> заявки</label>
            <div class="col-sm-8">
                <textarea rows="7" type="text" class="form-control" name="info" id="info" required maxlength="500"></textarea>
                <i class="fa fa-pencil form-control-feedback"></i>
            </div>
        </div>
        <center><h3 class="title">Контактная информация:</h3></center>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">ФИО</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="full_name" required>
                <i class="fa fa-pencil form-control-feedback"></i>
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
<br>
<script>
    $('#request').change(function () {
        if ($('#request option:selected').text() == "Потребность в ресурсе") {
            $('#info').attr("placeholder",
                    "Укажите необходимые Вам ресурсы и их количество, причину потребности, Ваше " +
                    "местоположение и промежуток времени, в который с Вами связаться.");
        } else if ($('#request option:selected').text() == "Пожертвование ресурса") {
            $('#info').attr("placeholder",
                    "Укажите имеющиеся у Вас ресурсы и их количество, их " +
                    "местоположение и промежуток времени, в который с Вами связаться.");
        }
    });
</script>

<%@include file = "layout2.jsp"%>