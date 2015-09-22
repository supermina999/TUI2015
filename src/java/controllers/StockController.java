package controllers;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class StockController
{
    public static void add(HttpServletRequest request) throws ClassNotFoundException, SQLException
    {
        String address = request.getParameter("address");
        String organization_id = request.getParameter("organization");
        String city_id = request.getParameter("city");
        DBModel.init();
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
}
