package controllers;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class StockController
{
    public static void add(HttpServletRequest request) throws Exception
    {
        String address = request.getParameter("address");
        String regionId = request.getParameter("region");
        String lon = request.getParameter("lon");
        String lat = request.getParameter("lat");
        Stock stock = new Stock();
        Location location = new Location();
        location.setRegionId(Integer.parseInt(regionId));
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.writeToDB();
        Location[] allLocations = Location.getAll(null);
        stock.setLocationId(allLocations[allLocations.length-1].getId());
        stock.writeToDB();
    }
    
    public static void update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String address = request.getParameter("address");
        String regionId = request.getParameter("region");
        String lon = request.getParameter("lon");
        String lat = request.getParameter("lat");
        int locationId = Stock.getOne(Integer.parseInt(id)).getLocationId();
        Location location = new Location();
        location.setRegionId(Integer.parseInt(regionId));
        location.setId(locationId);
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.saveChanges();
        Stock stock = new Stock();
        stock.setId(Integer.parseInt(id));
        stock.setLocationId(locationId);
        stock.saveChanges();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Stock stock = Stock.getOne(Integer.parseInt(id));
        int locationId = stock.getLocationId();
        Location location = new Location();
        location.setId(locationId);
        location.setRegionId(stock.getLocation().getRegionId());
        location.setId(locationId);
        location.setAddress(stock.getLocation().getAddress());
        location.setXCoord(1);
        location.setYCoord(1);
        location.delete();
        stock.delete();
    }
}
