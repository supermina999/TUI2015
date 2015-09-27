package controllers;

import models.*;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;

public class StationController {
    public static void add(HttpServletRequest request) throws Exception
    {
        String address = request.getParameter("address");
        String organization_id = request.getParameter("organization");
        String city_id = request.getParameter("city");
        Station station = new Station();
        Location location = new Location();
        location.setCityId(Integer.parseInt(city_id));
        location.setAddress(address);
        location.setXCoord(1);
        location.setYCoord(1);
        location.writeToDB();
        Location[] allLocations = Location.getAll(null);
        station.setLocationId(allLocations[allLocations.length-1].getId());
        station.setOrganizationId(Integer.parseInt(organization_id));
        station.writeToDB();
    }
    
    public static void update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String address = request.getParameter("address");
        String organization_id = request.getParameter("organization");
        String city_id = request.getParameter("city");
        int locationId = Stock.getOne(Integer.parseInt(id)).getLocationId();
        Location location = new Location();
        location.setCityId(Integer.parseInt(city_id));
        location.setId(locationId);
        location.setAddress(address);
        location.setXCoord(1);
        location.setYCoord(1);
        location.saveChanges();
        Station station = new Station();
        station.setId(Integer.parseInt(id));
        station.setLocationId(locationId);
        station.setOrganizationId(Integer.parseInt(organization_id));
        station.saveChanges();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Station data = Station.getOne(Integer.parseInt(id));
        int locationId = data.getLocationId();
        Location location = new Location();
        location.setId(locationId);
        location.setCityId(data.getLocation().getCityId());
        location.setId(locationId);
        location.setAddress(data.getLocation().getAddress());
        location.setXCoord(1);
        location.setYCoord(1);
        location.delete();
        Station station = new Station();
        station.setId(data.getId());
        station.setLocationId(locationId);
        station.setOrganizationId(data.getOrganizationId());
        station.delete();
    }
}
