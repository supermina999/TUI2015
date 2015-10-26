package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;

public class AvailableResourceController {
    
    public static int add(HttpServletRequest request) throws Exception
    {
        String resource = request.getParameter("resource_id");
        int resourceId = Integer.parseInt(resource);
        String numberS = request.getParameter("number");
        int number = Integer.parseInt(numberS);
        String stock = request.getParameter("stock_id");
        int stockId = Integer.parseInt(stock);
        String measure = request.getParameter("measure");
        int measureId = Integer.parseInt(request.getParameter("measure"));
        DBEntry[] params = {
            new DBEntry("stock_id", EntryType.Int, stockId),
            new DBEntry("resource_id", EntryType.Int, resourceId)
        };
        AvailableResource check = AvailableResource.getOne(params);
        if (check == null) {
            AvailableResource res = new AvailableResource();
            res.setStockId(stockId);
            res.setNumber(number);
            res.setResourceId(resourceId);
            res.setMeasureId(measureId);
            res.writeToDB();
            return res.getStockId();
        } else {
           int tNumber = check.getNumber();
           check.setNumber(tNumber + number);
           check.saveChanges();
           return check.getStockId();
        }
    }
    
    public static int update(HttpServletRequest request) throws Exception
    {   
        String idS;
        if ((idS = request.getParameter("id")) != null)
        {
            int id = Integer.parseInt(idS);
            AvailableResource res = AvailableResource.getOne(id);
            for (DBEntry entry : AvailableResource.stdEntryes)
            {
                String val = null;
                if ( (val = request.getParameter(entry.name)) != null)
                    {
                        res.updateEntry(entry, val);
                    }
            }
            res.saveChanges();
            return res.getStockId();
        }
        return 0;
    }
     public static AvailableResource delete(HttpServletRequest request) throws Exception
     {
        String idS;
        AvailableResource res = null;
        if ((idS = request.getParameter("id")) != null)
        {
            int id = Integer.parseInt(idS);
            res = AvailableResource.getOne(id);
            res.delete();
        }
        return res;
     }
     
    
}
