package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;


public class organizationController
{
    public static void add(HttpServletRequest request) throws Exception
    {
            String name = request.getParameter("name");
            name = new String(name.getBytes("iso8859-1"), "utf8");
            String address = request.getParameter("address");
            address = new String(address.getBytes("iso8859-1"), "utf8");
            String website = request.getParameter("website");        
            DBModel.init();
            Organization organization = new Organization();
            organization.setName(Sql.sql(name));
            organization.setAddress(Sql.sql(address));
            organization.setWebsite(Sql.sql(website));
            organization.writeToDB();
    }
}

