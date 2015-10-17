package controllers;

import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;

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
        app.setInfo(info);
        app.setFullName(fullName);
        app.setStatusId(1);
        app.setPhone(phone);
        app.setEmail(email);
        app.writeToDB();
    }
    
}
