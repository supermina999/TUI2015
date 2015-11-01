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
            Date dateFinish;
            Calendar buf = Calendar.getInstance();
            buf.setTime(dateStart);
            double prTime=0;
            int m = way.requests.size();
            int n = way.times.size();
            int j=0;
            for (Request req :way.requests)
            {
                dateStart = buf.getTime();
                buf.add(Calendar.MINUTE, new Double((way.times.get(n-m+j) - prTime)*60).intValue());
                prTime = way.times.get(n - m + j);
                dateFinish = buf.getTime();
                Transportation transportion = new Transportation();  
                transportion.setRequestId(req.getId());
                transportion.setSafetyId(safetyId);
                transportion.setStatus(0);
                transportion.setTimeStart(sdf.format(dateStart));
                transportion.setTimeFinish(sdf.format(dateFinish));
                transportion.setTransportId(way.transportId);
                transportion.writeToDB();
                req.setStatus(1);
                req.saveChanges();
                j++;
            }
        }
    }
    
}
