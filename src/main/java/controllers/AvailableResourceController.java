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
        String stock = request.getParameter("stockId");
        int stockId = Integer.parseInt(stock);
        int measureId = 1;
        
        Resource[] allResource = Resource.getAll(null);
        int resourceId = -1;
        for (int i = 0;i < allResource.length;i++)
        {
            if (allResource[i].getName().equals(name)) resourceId = allResource[i].getId();
        }
        if (resourceId == -1)
        {
            Resource resource = new Resource();
            resource.setName(name);
            resource.setWeight(weight);
            resource.writeToDB();
            Resource[] allRes = Resource.getAll(null);
            resourceId = allRes[allRes.length - 1].getId();
            AvailableResource availableResource = new AvailableResource();
            availableResource.setResourceId(resourceId);
            availableResource.setStockId(stockId);
            availableResource.setNumber(weight);
            availableResource.setMeasureId(measureId);
            availableResource.writeToDB();
        }
        else
        {
            AvailableResource[] availableRes = AvailableResource.getAll(null);
            int id = -1;
            for (int i = 0;i < availableRes.length;i++)
            {
                if (availableRes[i].getResourceId() == resourceId) id = i;
            }
            if (id == -1)
            {
                AvailableResource availableResource = new AvailableResource();
                availableResource.setResourceId(resourceId);
                availableResource.setStockId(stockId);
                availableResource.setNumber(weight);
                availableResource.setMeasureId(measureId);
                availableResource.writeToDB();
            }
            else
            {
                availableRes[id].setNumber(weight + availableRes[id].getNumber());
                availableRes[id].saveChanges();
            }
        }
    }
    
}
