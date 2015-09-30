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
        String weight = request.getParameter("number");
        int number = Integer.parseInt(weight);
        String cityName = request.getParameter("city");
        String stock = request.getParameter("stockId");
        int stockId = Integer.parseInt(stock);
        String station = request.getParameter("stationId");
        int stationId = Integer.parseInt(station);
        
        AvailableResource[] availableRes = AvailableResource.getAll(null);
        int resId = 0;
        for (int i = 0;i < availableRes.length;i++)
        {
            if (availableRes[i].getResourceId() == resourceId) resId = i;
        }
        int oldNumber = availableRes[resId].getNumber();
        int currentNumber = oldNumber - number;
        AvailableResource availableResource = new AvailableResource();
        availableResource.setId(availableRes[resId].getId());
        availableResource.setResourceId(resourceId);
        availableResource.setStockId(availableRes[resId].getStockId());
        availableResource.setNumber(currentNumber);
        availableResource.setMeasureId(1);
        availableResource.saveChanges();
        
        NeededResource[] neededRes = NeededResource.getAll(null);
        for (int i = 0;i < neededRes.length;i++)
        {
            if (neededRes[i].getResourceId() == resourceId) resId = i;
        }
        oldNumber = neededRes[resId].getNumber();
        currentNumber = oldNumber - number;
        if (currentNumber == 0)
        {
            NeededResource neededResource = new NeededResource();
            neededResource.setId(neededRes[resId].getId());
            neededResource.setResourceId(resourceId);
            neededResource.setStationId(neededRes[resId].getStationId());
            neededResource.setNumber(neededRes[resId].getNumber());
            neededResource.setMeasureId(neededRes[resId].getMeasureId());
            neededResource.delete();
        }
        else
        {
            NeededResource neededResource = new NeededResource();
            neededResource.setId(neededRes[resId].getId());
            neededResource.setResourceId(resourceId);
            neededResource.setStationId(neededRes[resId].getStationId());
            neededResource.setNumber(currentNumber);
            neededResource.setMeasureId(neededRes[resId].getMeasureId());
            neededResource.saveChanges();
        }
    }
}
