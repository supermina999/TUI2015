package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class ResourceController {
    public static void add(HttpServletRequest request) throws Exception
    {
        String name = request.getParameter("name");
        String number = request.getParameter("weight");
        String measure = request.getParameter("measure");
        int weight = Integer.parseInt(number);
        Resource resource = new Resource();
        resource.setName(Sql.sql(Sql.sql(name)));
        resource.setWeight(weight);
        resource.setMeasureId(Integer.parseInt(measure));
        resource.writeToDB();
    }
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int resourceId = Integer.parseInt(id);
        Resource resource = Resource.getOne(resourceId);
        resource.delete();
    }
    public static void change(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int resourceId = Integer.parseInt(id);
        String name = request.getParameter("name");
        String number = request.getParameter("weight");
        String measure = request.getParameter("measure");
        int weight = Integer.parseInt(number);
        Resource resource = Resource.getOne(resourceId);
        resource.setName(Sql.sql(name));
        resource.setWeight(weight);
        resource.setMeasureId(Integer.parseInt(measure));
        resource.saveChanges();
    }
}
