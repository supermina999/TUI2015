package controllers;

import models.*;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;

public class StationController {
    public static void add(HttpServletRequest request) throws ClassNotFoundException, SQLException
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
        Location[] all_locations = Location.getAll(null);
        station.setLocationId(all_locations.length);
        station.setOrganizationId(Integer.parseInt(organization_id));
        station.writeToDB();
    }
}
