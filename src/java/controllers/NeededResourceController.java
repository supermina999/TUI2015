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
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String cityName = request.getParameter("city");
        String station = request.getParameter("stationId");
        int stationId = Integer.parseInt(station);
        
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
        }
        
        int measureId = 1;
        int emergency = 1;
        
        NeededResource neededResource = new NeededResource();
        neededResource.setResourceId(resourceId);
        neededResource.setStationId(stationId);
        neededResource.setNumber(weight);
        neededResource.setMeasureId(measureId);
        neededResource.setEmergency(emergency);
        neededResource.writeToDB();
    }
    
}
