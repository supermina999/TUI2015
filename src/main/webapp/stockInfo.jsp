<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 4;
    String s = request.getParameter("id");
    Stock stock = new Stock();
    Transport[] transport = null;
    AvailableResource[] availableRes = AvailableResource.getAll(null);
    DBEntry[] params = {
        new DBEntry("stock_id", EntryType.Int, Integer.parseInt(s))
    };
    availableRes = AvailableResource.getAll(params);
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<% } else {
        stock = Stock.getOne(Integer.parseInt(s));
        transport = Transport.getAll(params);
    }
%>
<%@include file = "layout1.jsp"%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить склад?")) {
            return true;
        } else {
            return false;
        }
    }
</script>

<br>
<div class="form-block center-block" style="width: 70%;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeStockInfo.jsp?id=<%=stock.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteStock.jsp?id=<%=stock.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Склад № <%=Integer.parseInt(s)%></h2></center>
    <hr>
    <div class="form-group col-sm-12">
        <p style="font-size: 20px;"> <b>Расположение:</b> <%=stock.getLocation().getAddress()%>, <%=stock.getLocation().getRegionName()%>, <%=stock.getLocation().getCountryName()%> </p>
    </div>
    <div class="tabs-style-2">
        <ul class="nav nav-tabs" role="tablist">
            <li class="active text-center" style="width: 50%;"><a href="#h2tab1" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-briefcase"></i> Ресурсы</a></li>
            <li class="text-center" style="width: 50%;"><a href="#h2tab2" role="tab" data-toggle="tab" style="font-size: 15px;"><i class="fa fa-ambulance"></i> Транспорт</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="h2tab1" style="min-height: 800px;">
                <div class="gray-bg">
                    <br>
                    <div class="col-md-11">
                        <input type="text" class="form-control searchInput" placeholder="Название" style="width: 103%;" >
                        <i class="fa fa-search form-control-feedback"></i>
                    </div>
                    <br><br><br>
                </div> <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 70%;">Название</th>
                            <th style="width: 20%;">Количество</th> 
                            <th style="width: 5%;"></th>
                            <th style="width: 5%;"></th>
                        </tr>
                    </thead>
                    <tbody id="searchTable">
                        <%
                            for (int i = 0; i < availableRes.length; i++) {%>
                        <tr>
                            <td><a href="resourceInfo.jsp?id=<%=availableRes[i].getId()%>&stock_id=<%=Integer.parseInt(s)%>"> <%=availableRes[i].getResourceName()%></a></td>
                            <td><%=availableRes[i].getNumber()%> <%=availableRes[i].getMeasureName()%></td>      
                            <td><a href="changeResource.jsp?is_needed=false&id=<%=availableRes[i].getId()%>"><i class="fa fa-edit"></i></a></td>
                            <td><a href="deleteAvailableResource.jsp?id=<%=availableRes[i].getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade in active" id="h2tab2" style="min-height: 800px;">
            </div>        
        </div>
    </div>
</div>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>