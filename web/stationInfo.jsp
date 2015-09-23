<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0;
   String s = request.getParameter("id");
   Station station = new Station();
   DBEntry[] params = {
       new DBEntry("stock_id", EntryType.Int, Integer.parseInt(s))
   }; 
   AvailableResource[] availableRes = AvailableResource.getAll(null);
   Resource[] resource = Resource.getAll(null);
   if (s == null)
   {%>
        <script>
         window.location.href = "/";
        </script>
   <% } else {
    station = Station.getOne(Integer.parseInt(s));
   }
%>
<%@include file = "layout1.jsp"%>

<br>
    <div class="form-block center-block" style="width: 50%;">
        <center><h2 class="title">Пункты выдачи № <%=Integer.parseInt(s)%></h2></center>
        <hr>
         <form class="form-horizontal">
        
            <div class="form-group col-sm-7">
                <p style="font-size: 15px;"> <b>Организация:</b> <a href="organizationInfo.jsp?id=<%=station.getOrganizationId()%>"><%=station.getOrganizationName()%></a> </p>
                <p style="font-size: 15px;"> <b>Город:</b> <%=station.getLocation().getCityName()%>, <%=station.getLocation().getCountryName()%> </p>
                <p style="font-size: 15px;"> <b>Адрес:</b> <%=station.getLocation().getAddress()%> </p>
                    
            </div>
            <div class="form-group"></div>
            <div class="gray-bg">
                        <br>
                        <div class="col-md-11">
                            <input type="text" class="form-control" placeholder="Наименование" style="width: 110%;">
                            <i class="fa fa-search form-control-feedback" style="padding-left: 100%;"></i>
                        </div>
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table table-bordered">
                        <thead>
                                <tr>
                                    <th style="width: 50%;">Наименование</th>
                                        <th style="width: 25%;">Количество</th>
                                        <th style="width: 25%;">Единица измерения</th>
                                </tr>
                        </thead>
                        <tbody>
                            <%for (int j = 0; j < availableRes.length; j++)
                                {%>
                                <tr>
                                    <td style="width: 50%;">
                                        <%=availableRes[j].getResourceName()%></a>
                                    </td>
                                    <td style="width: 25%;">
                                        <%=availableRes[j].getNumber()%></a>
                                    </td>
                                    <td style="width: 25%;">
                                        <%=availableRes[j].getMeasureName()%></a>
                                    </td>
                                </tr>
                                <%}%>
                        </tbody>
                        </table>
        </form>
</div>
<%@include file = "layout2.jsp"%>