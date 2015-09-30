package users;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class User {
    public Person user;
    
    public boolean tryToLogin(HttpServletRequest request) throws Exception
    {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        DBEntry[] params = {
            new DBEntry("login", EntryType.String, login),
            new DBEntry("password", EntryType.String, password)
        };
        Person person = Person.getOne(params);
        if (person != null) 
        {
            user = person;
            return true;
        }
        return false;
    }
    
    public void exit()
    {
        user = null;
    }
    
    public boolean getStatus()
    {
        return user != null;
    }
    
    public boolean checkPermission(int minPermission)
    {
        return user.getPermissionId() <= minPermission;
    }
}
