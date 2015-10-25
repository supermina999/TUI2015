<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 2;
    Application[] app = Application.getAll(null);
    RequestType[] requestType = RequestType.getAll(null);
    Request[] req = Request.getAll(null);
%>

<%@include file = "layout1.jsp"%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить заявку?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<div class="form-block center-block" style="width: 70%">
    <center><h1>Заявки</h1></center>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-question-circle"></i> Новые</a></li>
            <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-check-circle"></i> Утвержденные</a></li>
        </ul>
        <div class="gray-bg">
            <br>
            <div class="col-md-8">
                <input type="text" class="form-control searchInput" placeholder="Поиск" style="width: 105%;" >
                <i class="fa fa-search form-control-feedback"></i>
            </div>
            <div class="col-md-4">
                <select class="form-control searchInput" style="width: 100%; padding-right: 0;" name="request">
                    <option>Выберите вид заявки</option>
                    <%for (int i = 0; i < requestType.length; i++) {%>
                    <option value="<%=requestType[i].getName()%>"><%=requestType[i].getName()%></option>
                    <%}%>
                </select>
            </div>
            <br><br><br>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 800px;">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%;">Номер</th>
                            <th style="width: 45%;">Cодержание</th>
                            <th style="width: 40%;">Контактная информация</th>
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%for (int i = 0; i < app.length; i++)
                                if (app[i].getStatus() == 1) {%>
                        <tr>
                            <td class="idSearch"><center><%=app[i].getId()%></center></td>
                    <td class="idSearch"><b>Вид: </b><%=app[i].getRequestTypeName()%> <br><%=app[i].getInfo()%></td>
                    <td class="idSearch">
                        <b>ФИО: </b><%=app[i].getFullName()%><br>
                        <b>Телефон: </b> <%=app[i].getPhone()%> <br>
                        <b> Email: </b> <%=app[i].getEmail()%> <br>
                    </td>
                    <td><a href="newRequest.jsp?id=<%=app[i].getId()%>"><i class="fa fa-check"></i></a></td>
                    <td><a href="deleteApplication.jsp?id=<%=app[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane" id="h2tab2" style="min-height: 800px;">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%;">Номер</th>
                            <th style="width: 50%;">Информация</th>
                            <th style="width: 45%;">Контактная информация</th>
                        </tr>
                    </thead>
                    <tbody id="searchTable1">
                        <%for (int i = 0; i < req.length; i++)
                                if (req[i].getStatus() == 1) {
                                    Application tApp = Application.getOne(req[i].getApplicationId());%>
                        <tr>
                            <td class="idSearch"><center><%=req[i].getId()%></center></td>
                    <td class="idSearch">
                        <b>Вид: </b><%=req[i].getRequestTypeName()%><br>
                        <b>Ресурс: </b><%=req[i].getResourceName()%> <%=req[i].getNumber()%> <%=req[i].getMeasureName()%><br>
                        <b>Местоположение:</b> <%=req[i].getLocation().getAddress()%>, <%=req[i].getLocation().getRegionName()%><br>
                        <b>Дата:</b> <%=req[i].getDateString()%>
                    </td>
                    <td class="idSearch">
                        <b>ФИО: </b><%=tApp.getFullName()%><br>
                        <b>Телефон: </b> <%=tApp.getPhone()%> <br>
                        <b> Email: </b> <%=tApp.getEmail()%> <br>
                    </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="js/checker.js"></script>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>