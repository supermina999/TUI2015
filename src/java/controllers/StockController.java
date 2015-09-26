package controllers;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class StockController
{
    public static void add(HttpServletRequest request) throws Exception
    {
        String address = request.getParameter("address");
        String organization_id = request.getParameter("organization");
        String city_id = request.getParameter("city");
        Stock stock = new Stock();
        Location location = new Location();
        location.setCityId(Integer.parseInt(city_id));
        location.setAddress(address);
        location.setXCoord(1);
        location.setYCoord(1);
        location.writeToDB();
        Location[] all_locations = Location.getAll(null);
        stock.setLocationId(all_locations.length);
        stock.setOrganizationId(Integer.parseInt(organization_id));
        stock.writeToDB();
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
        Stock stock = new Stock();
        stock.setId(Integer.parseInt(id));
        stock.setLocationId(locationId);
        stock.setOrganizationId(Integer.parseInt(organization_id));
        stock.saveChanges();
    }
}
