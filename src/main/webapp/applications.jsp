<%@page import="fileXLS.MakeFileXLS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 2;
    Application[] app = Application.getAll(null);
    RequestType[] requestType = RequestType.getAll(null);
    Request[] req = Request.getAll(null);
%>

<%@include file = "layout1.jsp"%>

<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 6) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    MakeFileXLS mfXLS = new MakeFileXLS();
    mfXLS.applications(0);
    mfXLS.applications(1);
    mfXLS.FullApplication(0);
    mfXLS.FullApplication(1);
%>

<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить заявку?")) {
            return true;
        } else {
            return false;
        }
    }
    function confirmDelete2() {
        if (confirm("Вы уверены, что хотите удалить уже утверждённую заявку?")) {
            return true;
        } else {
            return false;
        }
    }
</script>

<div class="form-group has-feedback center-block" style="width: 70%">
    <div style="margin-left: 81%;">
        <p><a href="newApplication.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить заявку</a></p>
    </div>
    <center><h1>Заявки</h1></center>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 35%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-question-circle"></i> Новые</a></li>
            <li class="text-center" style="width: 35%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-check-circle"></i> Утвержденные</a></li>
            <li class="text-center" style="width: 30%;"><a href="#h2tab3" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-list-alt"></i> Архив</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 1000px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8">
                        <input type="text" class="form-control searchInputText" placeholder="Поиск" style="width: 105%;" >
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
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%;">№</th>
                            <th style="width: 45%;">Cодержание</th>
                            <th style="width: 40%;">Контактная информация</th>
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%for (int i = 0; i < app.length; i++)
                                if (app[i].getStatus() == 0) {%>
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
            <div class="tab-pane" id="h2tab2" style="min-height: 1000px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8">
                        <input type="text" class="form-control searchInputText1" placeholder="Поиск" style="width: 105%;" >
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput1" style="width: 100%; padding-right: 0;" name="request">
                            <option>Выберите вид заявки</option>
                            <%for (int i = 0; i < requestType.length; i++) {%>
                            <option value="<%=requestType[i].getName()%>"><%=requestType[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                </div>
                <table class="table">
                    <thead>
                        <p><a href="/resources_ready.xls" download="resources_ready.xls">Скачать таблицу утвержденных заявок</a></p>
                        <p><a href="/full_resources_ready.xls" download="full_resources_ready.xls">Скачать полную таблицу утвержденных заявок</a></p>
                        <tr>
                            <th style="width: 5%;">№</th>
                            <th style="width: 40%;">Содержание</th>
                            <th style="width: 45%;">Контактная информация</th>
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable1">
                        <%for (int i = 0; i < req.length; i++)
                                if (req[i].getStatus() == 0) {
                                    Application tApp = Application.getOne(req[i].getApplicationId());%>
                        <tr>
                            <td class="idSearch1"><center><a href="requestInfo.jsp?id=<%=req[i].getId()%>"><%=req[i].getId()%></a></center></td>
                    <td class="idSearch1">
                        <b>Вид: </b><%=req[i].getRequestTypeName()%><br>
                        <b>Ресурс: </b><%=req[i].getResourceName()%> <%=req[i].getNumber()%> <%=req[i].getMeasureName()%><br>
                        <b>Местоположение:</b> <%=req[i].getLocation().getFullAddress()%><br>
                        <b>Дата:</b> <%=req[i].getDateString()%>
                    </td>
                    <td class="idSearch1">
                        <b>ФИО: </b><%=tApp.getFullName()%><br>
                        <b>Телефон: </b> <%=tApp.getPhone()%> <br>
                        <b> Email: </b> <%=tApp.getEmail()%> <br>
                    </td>
                    <td><a href="changeRequestInfo.jsp?id=<%=req[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                    <td><a href="deleteRequest.jsp?id=<%=req[i].getId()%>" onclick="return confirmDelete2();"><i class="fa fa-close"></i></a></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane" id="h2tab3" style="min-height: 1000px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8">
                        <input type="text" class="form-control searchInputText2" placeholder="Поиск" style="width: 105%;" >
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput2" style="width: 100%; padding-right: 0;" name="request">
                            <option>Выберите вид заявки</option>
                            <%for (int i = 0; i < requestType.length; i++) {%>
                            <option value="<%=requestType[i].getName()%>"><%=requestType[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                </div>
                <table class="table">
                    <thead>
                        <p><a href="/resources_done.xls" download="resources_done.xls">Скачать таблицу выполненых заявок</a></p>
                        <p><a href="/full_resources_done.xls" download="full_resources_done.xls">Скачать полную таблицу выполненых заявок</a></p>
                        <tr>
                            <th style="width: 5%;">№</th>
                            <th style="width: 45%;">Содержание</th>
                            <th style="width: 50%;">Контактная информация</th>
                        </tr>
                    </thead>
                    <tbody id="searchTable2">
                        <%for (int i = 0; i < req.length; i++)
                                if (req[i].getStatus() == 1) {
                                    Application tApp = Application.getOne(req[i].getApplicationId());%>
                        <tr>
                            <td class="idSearch2"><center><a href="requestInfo.jsp?id=<%=req[i].getId()%>"><%=req[i].getId()%></a></center></td>
                    <td class="idSearch2">
                        <b>Вид: </b><%=req[i].getRequestTypeName()%><br>
                        <b>Ресурс: </b><%=req[i].getResourceName()%> <%=req[i].getNumber()%> <%=req[i].getMeasureName()%><br>
                        <b>Местоположение:</b> <%=req[i].getLocation().getFullAddress()%><br>
                        <b>Дата:</b> <%=req[i].getDateString()%>
                    </td>
                    <td class="idSearch2">
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
<% }%>
<script src="js/checker.js"></script>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>