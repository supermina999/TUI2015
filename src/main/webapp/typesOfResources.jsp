<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
<%
    Resource[] resource = Resource.getAll(null);
%>
    <center>
            <br><h1>Виды ресурсов</h1><br>
            <div class="form-group has-feedback" style="width: 60%; min-height: 600px;">
            <div class="gray-bg">
                <br>
                <div class="col-md-4">
                    <input type="text" class="form-control searchInput" placeholder="Название" style="width: 320%;">
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
            <br><br><br>
            </div> <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 25%;">Название</th>
                        <th style="width: 25%;">Вес</th>
                    </tr>
                </thead>
                <tbody id="searchTable">
                    <%
                    for (int i = 0; i < resource.length; i++) {%>
                    <tr>
                        <td class="quantity idSearch"> <%= resource[i].getName() %> </td>
                        <td class="product"><%= resource[i].getWeight() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        
        <a href="newTypeOfResource.jsp" class="btn btn-default btn-lg">Добавить вид ресурса</a>
        <a href="changeTypeOfResource.jsp" class="btn btn-default btn-lg">Изменить вид ресурса</a>
        </div>
    </center>
<script src="js/search.js"></script>   
<%@include file = "layout2.jsp"%>