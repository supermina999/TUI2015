package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class ResourceController {
    public static void add(HttpServletRequest request) throws Exception
    {
        String name = request.getParameter("name");
        String number = request.getParameter("weight");
        int weight = Integer.parseInt(number);

        Resource resource = new Resource();
        resource.setName(name);
        resource.setWeight(weight);
        resource.writeToDB();
    }
    public static void delete(HttpServletRequest request) throws Exception
    {
        String resource_id = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource_id);

        Resource resource = new Resource();
        resource = Resource.getOne(resourceId);
        resource.delete();
    }
    public static void change(HttpServletRequest request) throws Exception
    {
        String resource_id = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource_id);
        String name = request.getParameter("name");
        String number = request.getParameter("weight");
        int weight = Integer.parseInt(number);
        
        Resource resource = new Resource();
        resource = Resource.getOne(resourceId);
       /* Resource[] allRes = Resource.getAll(null);
        Resource resource = new Resource();
        for (int i = 0;i < allRes.length;i++) 
        {
            if (allRes[i].getId() == resourceId) resource = allRes[i];
        }*/
        resource.setName(name);
        resource.setWeight(weight);
        resource.saveChanges();
    }
    public static void transit(HttpServletRequest request) throws Exception
    {
        String resource = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource);
        String weight = request.getParameter("number");
        int number = Integer.parseInt(weight);
        String cityName = request.getParameter("city");
        String stock = request.getParameter("stockId");
        int stockId = Integer.parseInt(stock);
        String station = request.getParameter("stationId");
        int stationId = Integer.parseInt(station);
        
        AvailableResource[] availableRes = AvailableResource.getAll(null);
        int resId = 0;
        for (int i = 0;i < availableRes.length;i++)
        {
            if (availableRes[i].getResourceId() == resourceId) resId = i;
        }
        int oldNumber = availableRes[resId].getNumber();
        int currentNumber = oldNumber - number;
        if (currentNumber == 0)
        {
            AvailableResource availableResource = new AvailableResource();
            availableResource.setId(availableRes[resId].getId());
            availableResource.setResourceId(resourceId);
            availableResource.setBaseId(availableRes[resId].getBaseId());
            availableResource.setNumber(availableRes[resId].getNumber());
            availableResource.setMeasureId(availableRes[resId].getMeasureId());
            availableResource.delete();
        }
        else
        {
            availableRes[resId].setNumber(currentNumber);
            availableRes[resId].saveChanges();
        }
        
        NeededResource[] neededRes = NeededResource.getAll(null);
        for (int i = 0;i < neededRes.length;i++)
        {
            if (neededRes[i].getResourceId() == resourceId) resId = i;
        }
        oldNumber = neededRes[resId].getNumber();
        currentNumber = oldNumber + number;
        neededRes[resId].setNumber(currentNumber);
        neededRes[resId].saveChanges();
    }
    public static void withdraw(HttpServletRequest request) throws Exception
    {
        String resource_id = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource_id);
        String weight = request.getParameter("number");
        int number = Integer.parseInt(weight);
        String cityId = request.getParameter("cityId");
        String stockId = request.getParameter("stockId");
        
        AvailableResource[] availableRes = AvailableResource.getAll(null);
        int availableResId = 0;
        for (int i = 0;i < availableRes.length;i++)
        {
            if (availableRes[i].getResourceId() == resourceId) availableResId = i;
        }
        number = availableRes[availableResId].getNumber() - number;
        availableRes[availableResId].setNumber(number);
        availableRes[availableResId].saveChanges();
    }
}
