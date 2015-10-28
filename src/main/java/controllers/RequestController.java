package controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class RequestController
{
    public static int add(HttpServletRequest request) throws Exception
    {
        String appId = request.getParameter("application_id");
        String requestType = request.getParameter("request");
        String resource = request.getParameter("resource");
        String number = request.getParameter("number");
        String dateS = request.getParameter("date");
        String regionId= request.getParameter("region");
        String address = request.getParameter("address");
        String lat = request.getParameter("lat");
        String lon = request.getParameter("lon");
        Request req = new Request();
        req.setRequestTypeId(Integer.parseInt(requestType));
        req.setResourceId(Integer.parseInt(resource));
        req.setNumber(Integer.parseInt(number));
        req.setApplicationId(Integer.parseInt(appId));
        Location location = new Location();
        location.setRegionId(Integer.parseInt(regionId));
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.writeToDB();
        Location[] allLocations = Location.getAll(null);
        req.setLocationId(allLocations[allLocations.length-1].getId());
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateS);
        req.setDate(date);
        req.setStatus(0);
        req.writeToDB();
        Request[] reqs = Request.getAll(null);
        return reqs[reqs.length-1].getId();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
       String idS;
       Request req = null;
       if ((idS = request.getParameter("id")) != null)
       {
           int id = Integer.parseInt(idS);
           req = Request.getOne(id);
           req.delete();
       }
    }
    
}
