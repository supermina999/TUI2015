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
        String baseIdToS = request.getParameter("baseIdTo");
        int baseIdTo = Integer.parseInt(baseIdToS);
        
        AvailableResource res = AvailableResource.getOne(resourceId);
        int resType = res.getResourceId();
        
        if (res.getNumber() - number > 0)
        {
            res.setNumber( res.getNumber() - number);
            res.saveChanges();
            DBEntry[] params = {
                new DBEntry("resource_id", EntryType.Int,resType),
                new DBEntry("base_id", EntryType.Int, baseIdTo)
            };
            AvailableResource nRes = AvailableResource.getOne(params);
            if (nRes == null)
            {
                nRes = new AvailableResource();
                nRes.setStockId(baseIdTo);
                nRes.setMeasureId(1);
                nRes.setNumber(number);
                nRes.setResourceId(resType);
                nRes.writeToDB();
            }
            else
            {
                nRes.setNumber(nRes.getNumber() + number);
                nRes.saveChanges();   
            }
        }
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
