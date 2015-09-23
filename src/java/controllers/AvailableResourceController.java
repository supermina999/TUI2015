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
        
        Location[] allLocation = Location.getAll(null);
        Stock[] allStock = Stock.getAll(null);
        int stockId = 0;
        for (int i = 0;i < allStock.length;i++)
        {
            if (allLocation[allStock[i].getLocationId()].getAddress().equals(stock)) stockId = allStock[i].getId();
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
