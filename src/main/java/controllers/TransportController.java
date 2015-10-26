package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class TransportController {
    
    public static void add(HttpServletRequest request) throws Exception
    {
        String typeId = request.getParameter("transport_type_id");
        String number = request.getParameter("number");
        String personId = request.getParameter("driver");
        String stockId = request.getParameter("stock_id");
        Transport transport = new Transport();
        transport.setTypeId(Integer.parseInt(typeId));
        transport.setNumber(Sql.sql(number));
        transport.setPersonId(Integer.parseInt(personId));
        transport.setStockId(Integer.parseInt(stockId));
        transport.writeToDB();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int transportId = Integer.parseInt(id);
        Transport transport = Transport.getOne(transportId);
        transport.delete();
    }
    
    public static void change(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String typeId = request.getParameter("transport_type_id");
        String number = request.getParameter("number");
        String personId = request.getParameter("driver");
        String stockId = request.getParameter("stock_id");
        Transport transport = Transport.getOne(Integer.parseInt(id));
        transport.setTypeId(Integer.parseInt(typeId));
        transport.setNumber(Sql.sql(number));
        transport.setPersonId(Integer.parseInt(personId));
        transport.setStockId(Integer.parseInt(stockId));
        transport.saveChanges();
    }
    
}
