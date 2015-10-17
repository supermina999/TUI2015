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
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<% } else {
        stock = Stock.getOne(Integer.parseInt(s));
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
<div class="form-block center-block" style="width: 50%; min-height: 500px;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeStockInfo.jsp?id=<%=stock.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteStock.jsp?id=<%=stock.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Склад № <%=Integer.parseInt(s)%></h2></center>
    <hr>
    <form class="form-horizontal">

        <div class="form-group col-sm-7">
            <p style="font-size: 15px;"> <b>Город:</b> <%=stock.getLocation().getRegionName()%>, <%=stock.getLocation().getCountryName()%> </p>
            <p style="font-size: 15px;"> <b>Адрес:</b> <%=stock.getLocation().getAddress()%> </p>

        </div>
        <div class="form-group"></div>
        <a href="stockResources.jsp?id=<%=stock.getId()%>" 
           class="btn btn-default btn-lg" style="width: 100%;">Ресурсы на складе</a>
    </form>
</div>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>