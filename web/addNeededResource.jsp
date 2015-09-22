<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<%
    String name = request.getParameter("name");
    //name = new String(name.getBytes("iso8859-1"), "utf8");
    String number = request.getParameter("number");
    //int weight = Integer.parseInt(number);
    String cityName = request.getParameter("city");
    //cityName = new String(cityName.getBytes("iso8859-1"), "utf8");
    String station = request.getParameter("station");
   // stock = new String(stock.getBytes("iso8859-1"), "utf8");
   // DBModel.init();
    
   /* Resource[] allRes = Resource.getAll(null);
    int resourceId;
    if (allRes.length == 0) resourceId = 0;
    else resourceId = allRes[allRes.length-1].getId();
    Resource resource = new Resource();
    resource.setId(resourceId + 1);
    resource.setName(name);
    resource.setWeight(weight);
    resource.writeToDB();
    
    City[] allCity = City.getAll(null);
    int cityId = -1;
    for (int i = 1; i <= allCity.length; i++)
    {
        if (allCity[i].getName() == cityName) cityId = allCity[i].getId();
    }
    if (cityId == -1) 
    {
        cityId = allCity.length + 1;
        City city = new City();
        city.setId(cityId);
        city.setName(cityName);
        city.setCountyId(1);
        city.writeToDB();
    }*/
    
    int stockId = 1;
    int measureId = 1;
    int resourceId = 1;
    int weight = 1;
    
    /*NeededResource[] allNeeded = NeededResource.getAll(null);
    int prevId;
    if (allNeeded.length == 0) prevId = 0;
    else prevId = allNeeded[allNeeded.length-1].getId();
    NeededResource neededResource = new NeededResource();
    neededResource.setId(prevId + 1);
    neededResource.setResourceId(resourceId);
    neededResource.setStationId(stockId);
    neededResource.setNumber(weight);
    neededResource.setMeasureId(measureId);
    neededResource.writeToDB();*/
%>
<script>
        window.location.href = "neededResources.jsp";
</script>
<%@include file = "layout2.jsp"%>