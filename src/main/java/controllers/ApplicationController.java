package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class ApplicationController
{
    public static boolean add(HttpServletRequest request) throws Exception
    {
        String requestType = request.getParameter("request");
        String info = request.getParameter("info");
        String fullName = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        if (requestType == null || info == null || fullName == null || phone == null || email == null) return false;
        if (requestType.equals("-1") || !Sql.isInt(requestType)) return false;
        Application app = new Application();
        app.setRequestTypeId(Integer.parseInt(requestType));
        app.setInfo(Sql.sql(info));
        app.setFullName(Sql.sql(fullName));
        app.setStatus(0);
        app.setPhone(Sql.sql(phone));
        app.setEmail(Sql.sql(email));
        app.writeToDB();
        return true;
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
       String idS;
       Application res = null;
       if ((idS = request.getParameter("id")) != null)
       {
           int id = Integer.parseInt(idS);
           res = Application.getOne(id);
           DBEntry[] params = {
                new DBEntry("application_id", EntryType.Int, id)
           };
           Request[] req = Request.getAll(params);
           for (Request req1 : req) {
                DBEntry[] params2 = {
                    new DBEntry("request_id", EntryType.Int, req1.getId())
                };
                Transportation[] transit = Transportation.getAll(params2);
                for (Transportation transit1 : transit) {
                     transit1.delete();
                }
                req1.delete();
           }
           res.delete();
       }
    }
    
    public static void changeStatus(int id) throws Exception {
        Application app = Application.getOne(id);
        app.setStatus(1);
        app.saveChanges();
    }
    
}
