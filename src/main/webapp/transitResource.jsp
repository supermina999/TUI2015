<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 3;
   %>
<%@include file = "layout1.jsp"%>
<%
    int stock_id = Integer.parseInt(request.getParameter("stock_id"));
    Stock stock = Stock.getOne(stock_id);
    Region[] region = Region.getAll(null);
    Country[] country = Country.getAll(null);
    Stock[] stocks = Stock.getAll(null);
    DBEntry[] params = {
        new DBEntry("stock_id", EntryType.Int, stock_id)
    };
    AvailableResource[] availableRes = AvailableResource.getAll(params);
%>
<br>
<div class="form-block center-block" style="min-height: 700px;">
    <center><h2 class="title">Перевезти ресурс</h2></center>
    <hr>
    <form class="form-horizontal" method="post" action="doTransitResource.jsp">
        <div class="form-group">
            <label class="col-sm-3 control-label">Наименование</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="resourceId">
                    <option>Выберите наименование</option>
                    <%for (int i = 0; i < availableRes.length; i++) {%>
                    <option value="<%=availableRes[i].getResourceId()%>"><%=availableRes[i].getResourceName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Количество</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="number">
            </div>
        </div>
        <center><h3 class="title">Место получения:</h3></center>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Страна</label>
            <div class="col-sm-8">
                <select id="countrySelect" class="form-control" style="width: 100%;" name="regionIn">
                    <option>Выберите страну</option>
                    <%for (int i = 0; i < country.length; i++) {%>
                    <option><%=country[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Область</label>
            <div class="col-sm-8">
                <select id="regionSelect" class="form-control" style="width: 100%;" name="regionIn">
                    <option>Выберите область</option>
                    <%for (int i = 0; i < region.length; i++) {%>
                    <option class="regionOption <%=region[i].getCountryName()%>"><%=region[i].getName()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group has-feedback">
            <label class="col-sm-3 control-label">Пункт назначения</label>
            <div class="col-sm-8">
                <select class="form-control" style="width: 100%;" name="stockIdTo">
                    <option>Выберите пункт назначения</option>
                    <%for (int i = 0; i < stocks.length; i++) {%>
                    <option  class ="stockOption <%=stocks[i].getLocation().getRegionName()%>" value="<%=stocks[i].getId()%>"><%=stocks[i].getLocation().getAddress()%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">					
                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
            </div>
        </div>
    </form>
</div>
<script>
    $("#countrySelect").change(function (){
        val = $(this).val();
        console.log(val);
        $.each($(".regionOption"), function(){
            console.log($(this).hasClass(val));
            if ($(this).hasClass(val))
            {
                $(this).removeAttr("disabled");
            }
            else $(this).attr("disabled","disabled");
        });
    });
     $("#regionSelect").change(function (){
        val = $(this).val();
        console.log(val);
        $.each($(".stockOption"), function(){
            console.log($(this).hasClass(val));
            if ($(this).hasClass(val))
            {
                $(this).removeAttr("disabled");
            }
            else $(this).attr("disabled","disabled");
        });
    });
</script>

<%@include file = "layout2.jsp"%>