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
        String personId = request.getParameter("person");
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
        stock.setPersonId(Integer.parseInt(personId));
        stock.setLocationId(allLocations[allLocations.length-1].getId());
        stock.writeToDB();
    }
    
    public static void update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String personId = request.getParameter("person");
        String address = request.getParameter("address");
        String regionId = request.getParameter("region");
        String lon = request.getParameter("lon");
        String lat = request.getParameter("lat");
        int locationId = Stock.getOne(Integer.parseInt(id)).getLocationId();
        Location location = Location.getOne(locationId);
        location.setRegionId(Integer.parseInt(regionId));
        location.setId(locationId);
        location.setAddress(address);
        location.setXCoord(Double.parseDouble(lon));
        location.setYCoord(Double.parseDouble(lat));
        location.saveChanges();
        Stock stock = Stock.getOne(Integer.parseInt(id));
        stock.setPersonId(Integer.parseInt(personId));
        stock.setLocationId(locationId);
        stock.saveChanges();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Stock stock = Stock.getOne(Integer.parseInt(id));
        int locationId = stock.getLocationId();
        Location location = Location.getOne(locationId);
        location.delete();
        DBEntry[] params = {
            new DBEntry("stock_id", EntryType.Int, Integer.parseInt(id))
        };
        AvailableResource[] aRes = AvailableResource.getAll(params);
        for (AvailableResource aRes1 : aRes) {
            aRes1.delete();
        }
        Transport[] transport = Transport.getAll(params);
        for (Transport transport1 : transport) {
            DBEntry[] params2 = {
                new DBEntry("transport_id", EntryType.Int, transport1.getId())
            };
            Transportation[] transit = Transportation.getAll(params2);
            for (Transportation transit1 : transit) {
                transit1.delete();
            }
            transport1.delete();
        }
        History[] history = History.getAll(params);
        for (History history1 : history) {
            history1.delete();
        }
        stock.delete();
    }
}
