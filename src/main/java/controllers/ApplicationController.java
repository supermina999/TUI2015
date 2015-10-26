package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;

public class ApplicationController
{
    public static void add(HttpServletRequest request) throws Exception
    {
        String requestType = request.getParameter("request");
        String info = request.getParameter("info");
        String fullName = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Application app = new Application();
        app.setRequestTypeId(Integer.parseInt(requestType));
        app.setInfo(Sql.sql(info));
        app.setFullName(Sql.sql(fullName));
        app.setStatus(1);
        app.setPhone(Sql.sql(phone));
        app.setEmail(Sql.sql(email));
        app.writeToDB();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
       String idS;
       Application res = null;
       if ((idS = request.getParameter("id")) != null)
       {
           int id = Integer.parseInt(idS);
           res = Application.getOne(id);
           res.delete();
       }
    }
    
    public static void changeStatus(int id) throws Exception {
        Application app = Application.getOne(id);
        app.setStatus(2);
        app.saveChanges();
    }
    
}
