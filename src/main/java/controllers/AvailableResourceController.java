package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class AvailableResourceController {
    public static AvailableResource add(HttpServletRequest request) throws Exception
    {
        String resource_id = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource_id);
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String baseIdS = request.getParameter("baseId");
        int baseId = Integer.parseInt(baseIdS);
        int measureId = 1;
        
        AvailableResource res = new AvailableResource();
        res.setBaseId(baseId);
        res.setNumber(weight);
        res.setResourceId(resourceId);
        res.setMeasureId(measureId);
        res.writeToDB();
        return res;
    }
    public static void update(HttpServletRequest request) throws Exception
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
        }
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
