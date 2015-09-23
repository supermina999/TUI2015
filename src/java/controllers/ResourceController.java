package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class ResourceController {
    public static void transit(HttpServletRequest request) throws Exception
    {
        String resource = request.getParameter("resourceId");
        int resourceId = Integer.parseInt(resource);
        String number = request.getParameter("number");
        int weight = Integer.parseInt(number);
        String cityName = request.getParameter("city");
        String stock = request.getParameter("stockId");
        int stockId = Integer.parseInt(stock);
        String station = request.getParameter("stationId");
        int stationId = Integer.parseInt(station);
        
        
    }
}
