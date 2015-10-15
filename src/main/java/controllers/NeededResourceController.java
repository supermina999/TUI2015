package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class NeededResourceController {
    public static NeededResource add(HttpServletRequest request) throws Exception
    {
        String resource_id = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource_id);
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String baseIdS = request.getParameter("baseId");
        int baseId = Integer.parseInt(baseIdS);
        int measureId = 1;
        
        NeededResource res = new NeededResource();
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
            NeededResource res = NeededResource.getOne(id);
            for (DBEntry entry : NeededResource.stdEntryes)
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
    public static NeededResource delete(HttpServletRequest request) throws Exception
    {
        String idS;
        NeededResource res = null;
        if ((idS = request.getParameter("id")) != null)
        {
            int id = Integer.parseInt(idS);
            res = NeededResource.getOne(id);
            res.delete();
        }
        return res;
    }
    
}
