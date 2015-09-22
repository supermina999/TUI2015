<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0;
   String s = request.getParameter("id");
   Person person = new Person();
   Organization org = new Organization();
   City city = new City();
   Permission permission = new Permission();
   if (s == null)
   {%>
        <script>
         window.location.href = "/";
        </script>
   <%} else {
        int i = Integer.parseInt(s);
        DBEntry[] paramsPerson = {
            new DBEntry("id", EntryType.Int, i)
        };   
        person = Person.getOne(paramsPerson);
        DBEntry[] paramsOrg = {
            new DBEntry("id", EntryType.Int, person.getOrganizationId())
        };  
        org = Organization.getOne(paramsOrg);
        DBEntry[] paramsCity = {
            new DBEntry("id", EntryType.Int, person.getCityId())
        };  
        city = City.getOne(paramsCity);
        DBEntry[] paramsPermission = {
            new DBEntry("id", EntryType.Int, person.getPermissionId())
        };  
        permission = Permission.getOne(paramsPermission);
    }
%>
<%@include file = "layout1.jsp"%>

<br>
    <div class="form-block center-block" style="width: 50%;">
        <center><h2 class="title"></h2><%=person.getName()%> <%=person.getSurname()%> <%=person.getSecondName()%></center>
        <hr>
         <form class="form-horizontal">
        <div class="col-lg-5 col-sm-5">
                <div class="box-style-1 gray-bg team-member">
                    <img src="images/team-member-2.jpg" alt="">
                </div>
        </div>
            <div class="form-group col-sm-7">
                <p style="font-size: 15px;"> <b>Организация:</b> <%=org.getName()%> </p>
                <p style="font-size: 15px;"> <b>Должность:</b> <%=permission.getName()%> </p>
                <p style="font-size: 15px;"> <b>Город:</b> <%=city.getName()%> </p>
                <p style="font-size: 15px;"> <b>Адрес:</b> <%=person.getAddress()%> </p>
                <p style="font-size: 15px;"> <b>Телефон:</b> <%=person.getPhone()%> </p>
                <p style="font-size: 15px;"> <b>Email:</b> <%=person.getEmail()%> </p>
                    
            </div>
            <div class="form-group"></div>
        </form>
</div>


<%@include file = "layout2.jsp"%>