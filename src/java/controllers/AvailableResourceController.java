package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class AvailableResourceController {
    public static void add(HttpServletRequest request) throws Exception
    {
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String cityName = request.getParameter("city");
        String stock = request.getParameter("stock");
        
        Resource resource = new Resource();
        resource.setName(name);
        resource.setWeight(weight);
        resource.writeToDB();
        Resource[] allRes = Resource.getAll(null);
        int resourceId;
        if (allRes.length == 0) resourceId = 0;
        else resourceId = allRes[allRes.length-1].getId();
        
        City[] allCity = City.getAll(null);
        int cityId = -1;
        for (int i = 0; i < allCity.length; i++)
        {
            if (allCity[i].getName() == cityName) cityId = allCity[i].getId();
        }
        if (cityId == -1) 
        {
            cityId = allCity.length + 1;
            City city = new City();
            city.setName(cityName);
            city.setCountryId(1);
            city.writeToDB();
        }
        
        Location[] allLocation = Location.getAll(null);
        Stock[] allStock = Stock.getAll(null);
        int stockId = 0;
        for (int i = 0;i < allStock.length;i++)
        {
            if (allLocation[allStock[i].getLocationId()].getAddress() == stock) stockId = allStock[i].getId();
        }
        
        int measureId = 1;
        
        AvailableResource availableResource = new AvailableResource();
        availableResource.setResourceId(resourceId);
        availableResource.setStockId(stockId);
        availableResource.setNumber(weight);
        availableResource.setMeasureId(measureId);
        availableResource.writeToDB();
    }
    
}
