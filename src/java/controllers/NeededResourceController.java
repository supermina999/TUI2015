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
        String station = request.getParameter("station");
        
        Resource resource = new Resource();
        resource.setName(name);
        resource.setWeight(weight);
        resource.writeToDB();
        Resource[] allRes = Resource.getAll(null);
        int resourceId;
        if (allRes.length == 0) resourceId = 0;
        else resourceId = allRes[allRes.length-1].getId();
        
        Location[] allLocation = Location.getAll(null);
        Station[] allStation = Station.getAll(null);
        int stationId = 0;
        for (int i = 0;i < allStation.length;i++)
        {
            if (allLocation[allStation[i].getLocationId()-1].getAddress().equals(station)) stationId = allStation[i].getId();
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
