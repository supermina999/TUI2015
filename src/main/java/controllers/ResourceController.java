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
}
