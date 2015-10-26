<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 0;
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
    }
%>
<%@include file = "layout1.jsp"%>
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
<div class="form-block center-block" style="width: 50%; min-height: 700px;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeUserInfo.jsp?id=<%=person.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteUser.jsp?id=<%=person.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title"><%=person.getFullName()%></h2></center>
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
            <p style="font-size: 15px;"> <b>Должность:</b> <%=person.getPermissionName()%> </p>
            <p style="font-size: 15px;"> <b>Местоположение:</b> <%=person.getCity()%>, <%=person.getRegionName()%>, <%=person.getCountryName()%> </p>
            <p style="font-size: 15px;"> <b>Адрес:</b> <%=person.getAddress()%> </p>
            <p style="font-size: 15px;"> <b>Телефон:</b> <%=person.getPhone()%> </p>
            <p style="font-size: 15px;"> <b>Email:</b> <%=person.getEmail()%> </p>
        </div>
        <div class="form-group"></div>
    </form>
</div>
<br>

<%@include file = "layout2.jsp"%>