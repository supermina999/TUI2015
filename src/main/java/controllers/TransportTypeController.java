package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class TransportTypeController {
    
    public static void add(HttpServletRequest request) throws Exception
    {
        String name = request.getParameter("name");
        String speed = request.getParameter("speed");
        String maxWeight = request.getParameter("maxWeight");
        TransportType transport = new TransportType();
        transport.setName(Sql.sql(name));
        transport.setSpeed(Integer.parseInt(speed));
        transport.setMaxWeight(Integer.parseInt(maxWeight));
        transport.writeToDB();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int typeId = Integer.parseInt(id);
        TransportType transport = TransportType.getOne(typeId);
        transport.delete();
    }
    
    public static void change(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int typeId = Integer.parseInt(id);
        String name = request.getParameter("name");
        String speed = request.getParameter("speed");
        String maxWeight = request.getParameter("maxWeight");
        TransportType transport = TransportType.getOne(typeId);
        transport.setName(Sql.sql(name));
        transport.setSpeed(Integer.parseInt(speed));
        transport.setMaxWeight(Integer.parseInt(maxWeight));
        transport.saveChanges();
    }
    
}
