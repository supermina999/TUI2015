package controllers;

import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class ApplicationController
{
    public static void add(HttpServletRequest request) throws Exception
    {
        String request_type = request.getParameter("request");
        String info = request.getParameter("info");
        String fullName = request.getParameter("full_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        Application app = new Application();
        app.setRequestTypeId(Integer.parseInt(request_type));
        app.setInfo(info);
        app.setFullName(fullName);
        app.setStatus(1);
        app.setPhone(phone);
        app.setEmail(email);
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
