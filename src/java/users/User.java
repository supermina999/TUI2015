package users;

import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import models.*;

public class User {
    public Person user;
    
    public boolean tryToLogin(String login, String password) throws Exception
    {
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
        user = new Person();
    }
    
    public boolean getStatus()
    {
        return user != null;
    }
}