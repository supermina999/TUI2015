<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 0;
    Resource[] resource = Resource.getAll(null);
    Region[] region = Region.getAll(null);
    Measure[] measure = Measure.getAll(null);
    String idS = request.getParameter("id");
    int id = Integer.parseInt(idS);
    Application app = Application.getOne(id);
%>
<%@include file = "layout1.jsp"%>
<br>
<div  class="form-block center-block" style="min-height: 700px; width: 50%">
    <center><h2 class="title">Обработка заявки</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="addRequest.jsp?application_id=<%=id%>&request=<%=app.getRequestTypeId()%>">
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label" style="padding-top: 0">Вид заявки:</label>
            <div class="col-sm-8">
                <p style="font-size: 15px; margin-bottom: 10px;"> <%=app.getRequestTypeName()%> </p>
            </div>
            <label class="col-sm-3 control-label" style="padding-top: 0">Содержание заявки:</label>
            <div class="col-sm-8">
                <p style="font-size: 15px; margin-bottom: 10px;"> <%=app.getInfo()%> </p>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Ресурс</label>
            <div class="col-sm-7">
                <select class="form-control" name="resource" id="request" style="width: 100%; padding-right: 0">
                    <option selected>Выберите вид ресурса</option>
                    <%for (int i = 0; i < resource.length; i++) {%>
                    <option value="<%=resource[i].getId()%>"><%=resource[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <div style="margin-top: 5px;">
                <a href="newTypeOfResource.jsp?" style="font-size: 20px;"><i class="fa fa-plus"></i></a>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Количество</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="number" style="padding-right: 0" required>
            </div>
            <div class="col-sm-2">
                <select class="form-control" name="measure" id="request" style="width: 100%; padding-right: 0">
                    <%for (int i = 0; i < measure.length; i++) {%>
                    <option value="<%=measure[i].getId()%>"><%=measure[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Дата</label>
            <div class="col-sm-8">
                <input type="date" class="form-control" name="date" style="padding-right: 0" required>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Область</label>
            <div class="col-sm-4">
                <select class="form-control" name="region" id="region" style="width: 105%; padding-right: 0">
                    <%for (int i = 0; i < region.length; i++) {%>
                    <option value="<%=region[i].getId()%>" <%if (i == 0) {%> selected <%}%>><%=region[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="col-sm-4">
                <select class="form-control" name="type" id="type" style="width: 100%; padding-right: 0">
                    <option selected id="1">По адресу</option>
                    <option>На карте</option>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Адрес</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="address" id="address" required>
                <i class="fa fa-map-marker form-control-feedback"></i>
            </div>
        </div>
        <div class="form-group has-feedback hidden" id="coords">
            <label class="col-sm-3 control-label">Широта</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="lat" id="lat" style="padding-right: 0">
            </div>
            <label class="col-sm-2 control-label">Долгота:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="lon" id="lon" style="padding-right: 0">
            </div>
        </div><br>
        <div id="map" style="width: 100%; height: 300px"></div><br>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">
                <input class="btn btn-block btn-default" type="submit" name="submit" value="Готово">
            </div>
        </div>
    </form>
</div>
<br>
<script src="js/stock.js"></script>
<%@include file = "layout2.jsp"%>