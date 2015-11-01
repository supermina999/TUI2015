<%@page import="java.util.Calendar"%>
<%@page import="maps.Way.StockDelta"%>
<%@page import="maps.Node"%>
<%@page import="maps.Way"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="maps.Planner"%>
<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 6;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";</script>
<%}
    int safetyId = Integer.parseInt(request.getParameter("safetyId"));
    ArrayList<Way> ways = Planner.plan.get(safetyId);
    if (ways == null) ways = new ArrayList<>();
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(Planner.date);
%>
<br>

<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<div class="form-block center-block" style="width: 80%; min-height: 700px;">
    <center><h2 class="title">Маршруты на <%=calendar.get(Calendar.YEAR)+"-"+calendar.get(Calendar.MONTH) +"-"+calendar.get(Calendar.DAY_OF_MONTH)%></h2></center>
    <center><h2 class="title">Минимальная безопасность: <%=Safety.getOne(safetyId).getName()%></h2></center>    
    <hr>
    <form class="form-horizontal" method = "post" action = "acceptPlan.jsp">  
    <table class="table">
        <thead>
            <tr>
                <th style="width: 1%;"><center>№</center></th>
                <th style="width: 25%;">Ресурс</th>
                <th style="width: 25%;">Транспорт</th>
                <th style="width: 40%;">Транспортировка</th>
                <th style="width: 10%;">Время отправления</th>
            </tr>
        </thead>
        <tbody id="searchTable">
            <%
            int i=0;
                for (Way way : ways)
                {
                    i++;
                    Transport car = Transport.getOne(way.transportId);
            %>
            <tr>
                <td class="idSearch">
        <center><%=i%></center>
        </td>
        <td class="idSearch">
            <%
                for (Request req : way.requests)
                {
            %><b>Заявка: <a href="requestInfo.jsp?id=<%=req.getId()%>">№<%=req.getId()%></a><br></b>
            <b>Вид: </b><%=req.getRequestTypeName()%><br>
            <b>Ресурс: </b><%=req.getResourceName()%> <%=req.getNumber()%> <%=req.getMeasureName()%><br>
            <%  }%>
        </td>
        <td class="idSearch">
            <b>Вид:</b> <%=car.getName() %><br>
            <b>Номер:</b> <%=car.getNumber()%><br>
            <b>Водитель: </b><a href="userInfo.jsp?id=<%=car.getPersonId()%>"><%=car.getDriverName()%></a><br>
        </td>
        <td class="idSearch">
            <%for(StockDelta delta: way.deltas){ 
               Stock stock = Stock.getOne(delta.stockId);
               Resource resType = Resource.getOne(delta.resourceTypeId);
            %>
            <b>Склад: <a href="stockInfo.jsp?id=<%=stock.getId()%>">№<%=stock.getId()%></a></b>, <%=stock.getFullAddress()%><br>
            <b>Изминение:</b> <%=(delta.delta>0?"-":"+") + Math.abs(delta.delta) + "" + resType.getMeasureName() + " " + resType.getName()%><br><%}%>
            <b>Время в пути:</b> <%= new Double(Math.floor(way.time)).intValue()+ ":" + new Double((way.time-Math.floor(way.time))*60).intValue()%>
        </td>
        <td>
            <input type="time" name="way<%=i%>time"/>
        </td>
        </tr>
        <% }%>
        </tbody>
    </table>      
        <div id="map" style="width: 100%; height: 600px"></div><br>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">			
                <input type="hidden" name="safetyId" value="<%=safetyId%>"/>
                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
            </div>
        </div>
    </form>
</div>
<br>
<% %>
<%@include file = "layout2.jsp"%>


<script>
            ymaps.ready(init);
            var myMap;
            function init() {
            myMap = new ymaps.Map("map", {
            center: [50.0, 36.15],
                    zoom: 6
            });
    <%
        for (Way way : ways) {
    %>
            myGeoObject = new ymaps.GeoObject({
            geometry: {
            type: "LineString",
                    coordinates: [<%
            for (int i1 = 0; i1 < way.path.nodes.size(); i1++) {
    %> [<%=way.path.nodes.get(i1).x%>, <%=way.path.nodes.get(i1).y%>] <%=(i1 + 1) == way.path.nodes.size() ? "" : ", "%>
    <%}%> ]
            },
                    properties: {
                    hintContent: "Москва-Берлиy"
                    }
            }, {
            // Включаем отображение в форме геодезических кривых.
            geodesic: true,
                    // Задаем ширину в 5 пикселей.
                    strokeWidth: 5,
                    // Задаем цвет линии.
                    strokeColor: "#F008"
            });
                    myMap.geoObjects.add(myGeoObject);
    <%
        }
    %>
            }
</script>

