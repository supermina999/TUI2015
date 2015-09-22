<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0;
   String s = request.getParameter("id");
   Organization org = new Organization();
   Person[] persons = null;
   City[] city = null;
   if (s == null)
   {%>
        <script>
         window.location.href = "/";
        </script>
    <%} else {
        int i = Integer.parseInt(request.getParameter("id"));
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, i)
        };   
        org = Organization.getOne(params);
        DBEntry[] personParams = {
            new DBEntry("organization_id", EntryType.Int, i)
        };   
        persons = Person.getAll(personParams);   
        city = City.getAll(null);
   }
   %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block" style="width: 50%;">
        <center><h2 class="title"><%=org.getName()%></h2></center>
        <hr>
         <form class="form-horizontal">
        <div class="col-lg-4 col-sm-4">
                <div class="box-style-1 gray-bg team-member">
                    <img src="images/old_logo.png" alt="">
                </div>
        </div>
            <div class="form-group col-sm-7">
                <p style="font-size: 20px;"> <b>Адрес:</b> <%=org.getAddress()%> </p>
                <p style="font-size: 20px;"> <b>Вебсайт:</b> <%=org.getWebsite()%> </p>
                <p style="font-size: 20px;"> <b>Волонтеры:</b> <%=persons.length%></p> 
                    
            </div>
            <div class="form-group"></div>
            <div class="gray-bg">
                        <br>
                        <div class="col-md-8">
                            <input type="text" class="form-control" placeholder="ФИО" style="width: 105%;">
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;">
                                    <option>Выберите город</option>
                                   <%for (int j = 0; j < city.length; j++)
                                    {%>
                                        <option><%=city[j].getName()%></option>
                                    <%}%>
                            </select>
                        </div>
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table table-bordered">
                        <thead>
                                <tr>
                                    <th style="width: 50%;">ФИО</th>
                                        <th style="width: 25%;">Телефон</th>
                                        <th style="width: 25%;">Email</th>
                                </tr>
                        </thead>
                        <tbody>
                            <%for (int j = 0; j < persons.length; j++)
                                {%>
                                <tr>
                                    <td style="width: 50%;">
                                        <a href="userInfo.jsp?id=<%=persons[j].getId()%>"><%=persons[j].getSurname()+" "+persons[j].getName()+" "+persons[j].getSecondName()%></a>
                                    </td>
                        
                                    <td style="width: 25%;"><%=persons[j].getPhone()%></td>
                        
                                    <td style="width: 25%;"><%=persons[j].getEmail()%></td>
                                </tr>
                                <%}%>
                        </tbody>
                        </table>
        </form>
</div>


<%@include file = "layout2.jsp"%>