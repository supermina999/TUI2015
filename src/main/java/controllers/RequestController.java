package controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

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
        if (appId == null || requestType == null || resource == null || number == null || dateS == null || regionId == null || address == null || lat == null || lon == null) return 0;
        if (!Sql.isInt(requestType) || !Sql.isInt(resource) || !Sql.isInt(number) || !Sql.isInt(appId) || !Sql.isInt(regionId) || !Sql.isDouble(lon) || !Sql.isDouble(lat) || !Sql.isDate(dateS)) return 0;
        if (resource.equals("-1") || regionId.equals("-1")) return 0;
        Request req = new Request();
        req.setRequestTypeId(Integer.parseInt(requestType));
        req.setResourceId(Integer.parseInt(resource));
        req.setNumber(Integer.parseInt(number));
        req.setApplicationId(Integer.parseInt(appId));
        Location location = new Location();
        location.setRegionId(Integer.parseInt(regionId));
        location.setAddress(Sql.sql(address));
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
    
    public static boolean update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String number = request.getParameter("number");
        String dateS = request.getParameter("date");
        String regionId= request.getParameter("region");
        String address = request.getParameter("address");
        String lat = request.getParameter("lat");
        String lon = request.getParameter("lon");
        if (id == null || number == null || dateS == null || regionId == null || address == null || lat == null || lon == null) return false;
        if (!Sql.isInt(id) || !Sql.isInt(number) || !Sql.isInt(regionId) || !Sql.isDouble(lon) || !Sql.isDouble(lat) || !Sql.isDate(dateS)) return false;
        if (regionId.equals("-1")) return false;
        Request req = Request.getOne(Integer.parseInt(id));
        int locationId = req.getLocationId();
        Location location = Location.getOne(locationId);
        location.setRegionId(Integer.parseInt(regionId));
        location.setId(locationId);
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.saveChanges();
        req.setNumber(Integer.parseInt(number));
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateS);
        req.setDate(date);
        req.saveChanges();
        return true;
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
       String idS;
       Request req = null;
       if ((idS = request.getParameter("id")) != null)
       {
           int id = Integer.parseInt(idS);
           req = Request.getOne(id);
           DBEntry[] params = {
                new DBEntry("request_id", EntryType.Int, id)
           };
           Transportation[] transit = Transportation.getAll(params);
           for (Transportation transit1 : transit) {
                transit1.delete();
           }
           req.delete();
       }
    }
    
}
