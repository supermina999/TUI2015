package controllers;

import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class StockController
{
    public static void add(HttpServletRequest request) throws Exception
    {
        String address = request.getParameter("address");
        String region_id = request.getParameter("region");
        String lon = request.getParameter("lon");
        String lat = request.getParameter("lat");
        Stock stock = new Stock();
        Date date = new Date();
        Location location = new Location();
        location.setRegionId(Integer.parseInt(region_id));
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.writeToDB();
        Location[] allLocations = Location.getAll(null);
        stock.setLocationId(allLocations[allLocations.length-1].getId());
        stock.setDate(date);
        stock.writeToDB();
    }
    
    public static void update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String address = request.getParameter("address");
        String region_id = request.getParameter("region");
        String lon = request.getParameter("lon");
        String lat = request.getParameter("lat");
        int locationId = Stock.getOne(Integer.parseInt(id)).getLocationId();
        Date date = Stock.getOne(Integer.parseInt(id)).getDate();
        Location location = new Location();
        location.setRegionId(Integer.parseInt(region_id));
        location.setId(locationId);
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.saveChanges();
        Stock stock = new Stock();
        stock.setId(Integer.parseInt(id));
        stock.setLocationId(locationId);
        stock.setDate(date);
        stock.saveChanges();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Stock data = Stock.getOne(Integer.parseInt(id));
        int locationId = data.getLocationId();
        Location location = new Location();
        location.setId(locationId);
        location.setRegionId(data.getLocation().getRegionId());
        location.setId(locationId);
        location.setAddress(data.getLocation().getAddress());
        location.setXCoord(1);
        location.setYCoord(1);
        location.delete();
        Stock stock = new Stock();
        stock.setId(data.getId());
        stock.setLocationId(locationId);
        stock.delete();
    }
}
