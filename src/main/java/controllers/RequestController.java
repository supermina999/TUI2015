package controllers;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class RequestController
{
    public static int add(HttpServletRequest request) throws Exception
    {
        String appId = request.getParameter("applicationId");
        String request_type = request.getParameter("request");
        String resource = request.getParameter("resource");
        String number = request.getParameter("number");
        String measure = request.getParameter("measure");
        String date_s = request.getParameter("date");
        String region_id= request.getParameter("region");
        String address = request.getParameter("address");
        String lat = request.getParameter("lat");
        String lon = request.getParameter("lon");
        Request req = new Request();
        req.setRequestTypeId(Integer.parseInt(request_type));
        req.setResourceId(Integer.parseInt(resource));
        req.setNumber(Integer.parseInt(number));
        req.setMeasureId(Integer.parseInt(measure));
        req.setApplicationId(Integer.parseInt(appId));
        Location location = new Location();
        location.setRegionId(Integer.parseInt(region_id));
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.writeToDB();
        Location[] allLocations = Location.getAll(null);
        req.setLocationId(allLocations[allLocations.length-1].getId());
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date_s);
        req.setDate(date);
        req.setStatusId(1);
        req.setEmergencyId(1);
        req.writeToDB();
        Request[] reqs = Request.getAll(null);
        return reqs.length;
    }
    
}
