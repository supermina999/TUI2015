<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0;
   int i = Integer.parseInt(request.getParameter("id"));
   DBEntry[] params = {
       new DBEntry("id", EntryType.Int, i)
   };   
   Organization org = Organization.getOne(params);
   
   DBEntry[] personParams = {
       new DBEntry("organization_id", EntryType.Int, i)
   };   
   
   Person[] persons = Person.getAll(personParams);   
   City[] city = City.getAll(null);
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
                                    <th style="width: 50%;"><%
                                    for (int j = 0; j < persons.length; j++)
                                    {%>
                                        <h4><%=persons[j].getName()+" "+persons[j].getSurname()+" "+persons[j].getSecondName()%></h4>
                                    <%}%></th>
                        
                                    <th style="width: 25%;"><%
                                    for (int j = 0; j < persons.length; j++)
                                    {%>
                                        <h4><%=persons[j].getPhone()%></h4>
                                    <%}%></th>
                        
                                    <th style="width: 25%;"><% 
                                    for (int j = 0; j < persons.length; j++)
                                    {%>
                                        <h4><%=persons[j].getEmail()%></h4>
                                    <%}%></th>
                                </tr>
                        </thead>
                        <tbody>
                                <tr>
                                        <td class="quantity">2 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.4 Smartphone</a><span class="small">4.7" Dual Core 1GB</span></td>
                                        <td class="amount">$199.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.2 Tablet</a><span class="small">7.3" Quad Core 2GB</span></td>
                                        <td class="amount">$299.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Desktop PC</a><span class="small">Quad Core 3.2MHz, 8GB RAM, 1TB Hard Disk</span></td>
                                        <td class="amount">$1499.00</td>
                                </tr>
                        </tbody>
                        </table>
        </form>
</div>


<%@include file = "layout2.jsp"%>