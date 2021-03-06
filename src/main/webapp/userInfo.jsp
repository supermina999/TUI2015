<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else {
    String s = request.getParameter("id");
    Person person = new Person();
    int id = 0;
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%
    } else {
        person = Person.getOne(Integer.parseInt(s));
        id = Integer.parseInt(s);
        if (id != user.user.getId() && user.user.getPermissionId() != 1) {%>
        <%@include file = "wrongPermission.jsp"%>
        <%} else { 
%>

<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить пользователя?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<br>
<div class="form-block center-block" style="width: 50%; min-height: 1200px;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeUserInfo.jsp?id=<%=person.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteUser.jsp?id=<%=person.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
            <hr><center><h2 class="title"><%=person.getFullName()%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="col-lg-5 col-sm-5">
            <div class="box-style-1 gray-bg team-member">
                <% if (id > 0 && id< 6) { %>
                    <img src="images/<%=person.getLogin()%>Avatar.jpg" alt="">
                <% } else { %>
                    <img src="images/avatar2.jpg" alt="">
                <% } %>
            </div>
        </div>
        <div class="form-group col-sm-7">
            <p style="font-size: 15px; margin-bottom: 15px;"> <b>Должность:</b> <%=person.getPermissionName()%> </p>
            <p style="font-size: 15px; margin-bottom: 15px;"> <b>Дата рождения:</b> <%=person.getBirthday()%> </p>
            <p style="font-size: 15px; margin-bottom: 15px;"> <b>Место проживания:</b> <%=person.getCity()%>, <%=person.getRegionName()%>, <%=person.getCountryName()%> </p>
            <p style="font-size: 15px; margin-bottom: 15px;"> <b>Адрес:</b> <%=person.getAddress()%> </p>
            <p style="font-size: 15px; margin-bottom: 15px;"> <b>Телефон:</b> <%=person.getPhone()%> </p>
            <p style="font-size: 15px; margin-bottom: 15px;"> <b>Email:</b> <%=person.getEmail()%> </p>
        </div>
        <div class="form-group"></div>
    </form>
    <% if (user.user.getId() == id) {
       int pId = person.getPermissionId();
       if (pId == 1) {%> <%@include file = "desk1.jsp"%> <%}
       else if (pId == 2) {%> <%@include file = "desk2.jsp"%> <%}
       else if (pId == 3) {%> <%@include file = "desk3.jsp"%> <%}
       else if (pId == 4) {%> <%@include file = "desk4.jsp"%> <%}
       else if (pId == 5) {%> <%@include file = "desk5.jsp"%> <%}
       else if (pId == 6) {%> <%@include file = "desk6.jsp"%> <%}
    }
    %>
</div>
<br>
<% }}} %>
<%@include file = "layout2.jsp"%>