package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class AvailableResourceController {
    public static void add(HttpServletRequest request) throws Exception
    {
        String resource_id = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource_id);
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String city = request.getParameter("cityId");
        int cityId = Integer.parseInt(city);
        String stock = request.getParameter("stockId");
        int stockId = Integer.parseInt(stock);
        int measureId = 1;
        
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
            availableResource.setBaseId(stockId);
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
