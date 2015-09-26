<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 4;
   String s = request.getParameter("id");
   Stock stock = new Stock();
   AvailableResource[] availableRes = AvailableResource.getAll(null);
   DBEntry[] params = {
       new DBEntry("stock_id", EntryType.Int, Integer.parseInt(s))
   }; 
   availableRes = AvailableResource.getAll(params);
   if (s == null)
   {%>
        <script>
         window.location.href = "/";
        </script>
   <% } else {
    stock = Stock.getOne(Integer.parseInt(s));
   }
%>
<%@include file = "layout1.jsp"%>

<br>
    <div class="form-block center-block" style="width: 50%;">
        <div style="margin-left: 95%;"><p style="font-size: 25px;"><a href="changeStockInfo.jsp?id=<%=stock.getId()%>"><i class="fa fa-edit"></i></a><p></div>
        <center><h2 class="title">Склад № <%=Integer.parseInt(s)%></h2></center>
        <hr>
         <form class="form-horizontal">
        
            <div class="form-group col-sm-7">
                <p style="font-size: 15px;"> <b>Организация:</b> <a href="organizationInfo.jsp?id=<%=stock.getOrganizationId()%>"><%=stock.getOrganizationName()%></a> </p>
                <p style="font-size: 15px;"> <b>Город:</b> <%=stock.getLocation().getCityName()%>, <%=stock.getLocation().getCountryName()%> </p>
                <p style="font-size: 15px;"> <b>Адрес:</b> <%=stock.getLocation().getAddress()%> </p>
                    
            </div>
            <div class="form-group"></div>
            <div class="gray-bg">
                        <br>
                        <div class="col-md-11">
                            <input type="text" class="form-control" placeholder="Наименование" style="width: 110%;" id="searchIdInput">
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
                        <tbody id="searchTable">
                            <%for (int j = 0; j < availableRes.length; j++)
                                {%>
                                <tr>
                                    <td style="width: 50%;" class="idSearch">
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
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>