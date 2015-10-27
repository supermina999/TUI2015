package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class TransportationController {
     
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        int transitId = Integer.parseInt(id);
        Transportation transit = Transportation.getOne(transitId);
        transit.delete();
    }
    
    public static void change(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String requestId = request.getParameter("request_id");
        String transportId = request.getParameter("transport_id");
        String timeStart = request.getParameter("time_start");
        String timeFinish = request.getParameter("time_finish");
        String safetyId = request.getParameter("safety_id");
        Transportation transit = Transportation.getOne(Integer.parseInt(id));
        transit.setRequestId(Integer.parseInt(requestId));
        transit.setTransportId(Integer.parseInt(transportId));
        transit.setTimeStart(Sql.sql(timeStart));
        transit.setTimeFinish(Sql.sql(timeFinish));
        transit.setSafetyId(Integer.parseInt(safetyId));
        transit.saveChanges();
    }
    
    public static int confirm(HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        Transportation transit = Transportation.getOne(Integer.parseInt(id));
        int requestId = transit.getRequestId();
        Request req = Request.getOne(requestId);
        int requestTypeId = req.getRequestTypeId();
        int resourceId = req.getResourceId();
        int number = req.getNumber();
        int measureId = req.getMeasureId();
        int stockId = transit.getStockId();
        DBEntry[] params = {
            new DBEntry("stock_id", EntryType.Int, stockId),
            new DBEntry("resource_id", EntryType.Int, resourceId),
            new DBEntry("measure_id", EntryType.Int, measureId)
        };
        AvailableResource aRes = AvailableResource.getOne(params);
        transit.setStatus(2);
        transit.saveChanges();
        if (requestTypeId == 1) {
            int tNumber = aRes.getNumber();
            aRes.setNumber(tNumber - number);
            aRes.saveChanges();
            return aRes.getStockId();
        } else {
            if (aRes == null) {
                AvailableResource res = new AvailableResource();
                res.setStockId(stockId);
                res.setNumber(number);
                res.setResourceId(resourceId);
                res.setMeasureId(measureId);
                res.writeToDB();
                return res.getStockId();
            } else {
               int tNumber = aRes.getNumber();
               aRes.setNumber(tNumber + number);
               aRes.saveChanges();
               return aRes.getStockId();
            }
        }
    }
    
}
