package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class NeededResourceController {
    public static void add(HttpServletRequest request) throws Exception
    {
        String name = request.getParameter("name");
        String resourceIdString = request.getParameter("resourceId");
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String cityName = request.getParameter("city");
        String station = request.getParameter("stationId");
        int stationId = Integer.parseInt(station);
        int measureId = 1;
        int emergency = 1;
        
        Resource[] allResource = Resource.getAll(null);
        int resourceId = -1;
        for (int i = 0;i < allResource.length;i++)
        {
            if (allResource[i].getName().equals(name)) resourceId = allResource[i].getId();
        }
        if (resourceIdString != null) resourceId = Integer.parseInt(resourceIdString);
        if (resourceId == -1)
        {
            Resource resource = new Resource();
            resource.setName(name);
            resource.setWeight(weight);
            resource.writeToDB();
            Resource[] allRes = Resource.getAll(null);
            resourceId = allRes[allRes.length - 1].getId();
            NeededResource neededResource = new NeededResource();
            neededResource.setResourceId(resourceId);
            neededResource.setBaseId(stationId);
            neededResource.setNumber(weight);
            neededResource.setMeasureId(measureId);
            neededResource.setEmergency(emergency);
            neededResource.writeToDB();
        }
        else
        {
            NeededResource neededResource = new NeededResource();
            neededResource.setResourceId(resourceId);
            neededResource.setBaseId(stationId);
            neededResource.setMeasureId(measureId);
            neededResource.setEmergency(emergency);
            neededResource.writeToDB();
        }
    }
    public static void update(HttpServletRequest request) throws Exception
    {   
        String idS;
        if ((idS = request.getParameter("id")) != null)
        {
            int id = Integer.parseInt(idS);
            NeededResource res = NeededResource.getOne(id);
            for (DBEntry entry : NeededResource.stdEntryes)
            {
                String val = null;
                if ( (val = request.getParameter(entry.name)) != null)
                    {
                        res.updateEntry(entry, val);
                    }
            }
            res.saveChanges();
        }
    }
    public static void delete(HttpServletRequest request) throws Exception
    {
        String idS;
        if ((idS = request.getParameter("id")) != null)
        {
            int id = Integer.parseInt(idS);
            NeededResource.getOne(id).delete();
        }
    }
    
}
