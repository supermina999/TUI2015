<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 7;
%>
<%@include file = "layout1.jsp"%>
<%
    Permission[] permission = Permission.getAll(null);
    Region[] region = Region.getAll(null);
    Person[] person = Person.getAll(null);
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить профиль волонтера?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 800px;">
        <div style="margin-left: 47%;">
            <p><a href="register.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Регистрация</a></p>
        </div>
        <center>
            <h1>Волонтёры</h1><br> </center>
            <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-4">
                        <input type="text" class="form-control searchInputText" placeholder="ФИО" style="width: 105%;">
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput region" style="width: 105%;" name = "region">
                            <option>Выберите область</option>
                            <%for (int i = 0; i < region.length; i++) {%>
                            <option><%=region[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control searchInput" style="width: 100%; padding-left: 5px" name = "permission">
                            <option>Выберите должность</option>
                            <%for (int i = 0; i < permission.length; i++) {%>
                            <option><%=permission[i].getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                </div> <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 5%">№</th>
                            <th style="width: 10%;">Логин</th>
                            <th style="width: 25%;">ФИО</th>
                            <th style="width: 20%;">Должность</th>
                            <th style="width: 30%;">Место проживания</th>
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%
                    for (int i = 0; i < person.length; i++) {%>
                        <tr>
                            <td class="idSearch"><%=person[i].getId()%></td>
                            <td class="idSearch"><%=person[i].getLogin()%></td>
                            <td class="idSearch"><a href="userInfo.jsp?id=<%=person[i].getId()%>"><%=person[i].getFullName()%></a></td>
                            <td class="idSearch"><%=person[i].getPermissionName()%></td>
                            <td class="idSearch"><%=person[i].getCity()%>, <%=person[i].getRegionName()%></td>
                            <td><a href="changeUserInfo.jsp?id=<%=person[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteUser.jsp?id=<%=person[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
    </div>
</center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>
