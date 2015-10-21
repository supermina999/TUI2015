<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 3;
%>
<%@include file = "layout1.jsp"%>
<%
    Resource[] resource = Resource.getAll(null);
%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить вид ресурса?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<center>
    <div class="form-group has-feedback center-block" style="width: 100%; min-height: 800px;">
        <div style="margin-left: 50%;">
            <p><a href="newTypeOfResource.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Добавить вид</a></p>
        </div>
        <center>
            <h1>Виды ресурсов</h1><br> </center>
        <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
            <div class="gray-bg">
                <br>
                <div class="col-md-11">
                    <input type="text" class="form-control searchInput" placeholder="Наименование" style="width: 110%;">
                    <i class="fa fa-search form-control-feedback" style="padding-left: 100%;"></i>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 50%;">Название</th>
                        <th style="width: 40%;">Вес</th>
                        <th style="width: 5%;"></th>
                        <th style="width: 5%;"></th>
                    </tr>
                </thead>
                <tbody id="searchTable">
                    <%
                    for (int i = 0; i < resource.length; i++) {%>
                    <tr>
                        <td class="quantity idSearch"> <%= resource[i].getName()%> </td>
                        <td class="product"><%= resource[i].getWeight()%></td>
                        <td><a href="changeTypeOfResource.jsp?resourceId=<%=resource[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                        <td><a href="deleteTypeOfResource.jsp?resourceId=<%=resource[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </div>
</center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>