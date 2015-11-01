/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import maps.Planner;
import maps.Way;
import models.Request;
import models.Transportation;

/**
 *
 * @author roma
 */
public class PlanController {
    public static void acceptPlan(HttpServletRequest request) throws Exception
    {
        int safetyId = Integer.parseInt(request.getParameter("safetyId"));
        ArrayList<Way> ways = Planner.plan.get(safetyId);
        Planner.accepted(safetyId);
        int i=0;
        for (Way way: ways)
        {
            i++;
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            Date dateStart = sdf.parse(request.getParameter("way"+i+"time"));
            Calendar buf = Calendar.getInstance();
            buf.setTime(dateStart);
            buf.add(Calendar.MINUTE, new Double(way.time*60).intValue());
            Date dateFinish = buf.getTime();
            for (Request req :way.requests)
            {
                Transportation transportion = new Transportation();  
                transportion.setRequestId(req.getId());
                transportion.setSafetyId(safetyId);
                transportion.setStatus(0);
                transportion.setTimeStart(sdf.format(dateStart));
                transportion.setTimeFinish(sdf.format(dateFinish));
                transportion.setTransportId(way.transportId);
                transportion.writeToDB();
            }
        }
    }
    
}
