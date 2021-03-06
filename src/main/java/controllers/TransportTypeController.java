package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class TransportTypeController {
    
    public static void add(HttpServletRequest request) throws Exception
    {
        String name = request.getParameter("name");
        String speed = request.getParameter("speed");
        String maxWeight = request.getParameter("max_weight");
        TransportType transport = new TransportType();
        transport.setName(Sql.sql(name));
        transport.setSpeed(Integer.parseInt(speed));
        transport.setMaxWeight(Double.parseDouble(maxWeight));
        transport.writeToDB();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int typeId = Integer.parseInt(id);
        TransportType transport = TransportType.getOne(typeId);
        DBEntry[] params = {
            new DBEntry("type_id", EntryType.Int, typeId)
        };
        Transport[] trans = Transport.getAll(params);
        for (Transport trans1 : trans) {
            DBEntry[] params2 = {
                new DBEntry("transport_id", EntryType.Int, trans1.getId())
            };
            Transportation[] transit = Transportation.getAll(params2);
            for (Transportation transit1 : transit) {
                transit1.delete();
            }
            trans1.delete();
        }
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
        transport.setMaxWeight(Double.parseDouble(maxWeight));
        transport.saveChanges();
    }
    
}
