<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 0;
    Application[] app = Application.getAll(null);
    RequestType[] requestType = RequestType.getAll(null);
%>

<%@include file = "layout1.jsp"%>

<div class="form-block center-block" style="width: 70%">
    <center><h1>Заявки</h1></center>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-question-circle"></i> Новые</a></li>
            <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-check-circle"></i> Утвержденные</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 800px;">
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
                                if (app[i].getStatusId() == 1) {%>
                        <tr>
                            <td class="idSearch"><center><%=app[i].getId()%></center></td>
                    <td class="idSearch"><b>Вид: </b><%=app[i].getRequestTypeName()%> <br><%=app[i].getInfo()%></td>
                    <td class="idSearch">
                        <b>ФИО: </b><%=app[i].getFullName()%><br>
                        <b>Тел.: </b> <%=app[i].getPhone()%> <br>
                        <b> Email: </b> <%=app[i].getEmail()%> <br>
                    </td>
                    <td><i class="fa fa-check"></i></td>
                    <td><i class="fa fa-close"></i></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="h2tab2" style="min-height: 800px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-8">
                        <input type="text" class="form-control searchInput" placeholder="Поиск" style="width: 105%;" >
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput" style="width: 105%; padding-right: 0;" name="requestType">
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
                            <th style="width: 5%;">Номер</th>
                            <th style="width: 45%;">Cодержание</th>
                            <th style="width: 40%;">Контактная информация</th>
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <tr>
                            <%for (int i = 0; i < app.length; i++)
                                    if (app[i].getStatusId() == 2) {%>
                            <td class="idSearch"><center><%=app[i].getId()%></center></td>
                    <td class="idSearch"><b>Вид: </b><%=app[i].getRequestTypeName()%> <br><%=app[i].getInfo()%></td>
                    <td class="idSearch">
                        <b>ФИО: </b><%=app[i].getFullName()%><br>
                        <b>Тел.: </b> <%=app[i].getPhone()%> <br>
                        <b> Email: </b> <%=app[i].getEmail()%> <br>
                    </td>
                    <td><i class="fa fa-check"></i></td>
                    <td><i class="fa fa-close"></i></td>
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