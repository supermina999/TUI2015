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
        double weight = Double.parseDouble(number);
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
        DBEntry[] params = {
            new DBEntry("resource_id", EntryType.Int, resourceId)
        };
        AvailableResource[] aRes = AvailableResource.getAll(params);
        for (AvailableResource aRes1 : aRes) {
            aRes1.delete();
        }
        History[] history = History.getAll(params);
        for (History history1 : history) {
            history1.delete();
        }
        Request[] req = Request.getAll(params);
        for (Request req1 : req) {
            DBEntry[] params2 = {
                new DBEntry("request_id", EntryType.Int, req1.getId())
            };
            Transportation[] transit = Transportation.getAll(params2);
            for (Transportation transit1 : transit) {
                 transit1.delete();
            }
            req1.delete();
        }
        resource.delete();
    }
    public static void change(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int resourceId = Integer.parseInt(id);
        String name = request.getParameter("name");
        String number = request.getParameter("weight");
        String measure = request.getParameter("measure");
        double weight = Double.parseDouble(number);
        Resource resource = Resource.getOne(resourceId);
        resource.setName(Sql.sql(name));
        resource.setWeight(weight);
        resource.setMeasureId(Integer.parseInt(measure));
        resource.saveChanges();
    }
}
