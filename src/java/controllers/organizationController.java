package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;


public class organizationController
{
    public static void add(HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException
    {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String website = request.getParameter("website");
            Organization organization = new Organization();
            organization.setName(Sql.sql(name));
            organization.setAddress(Sql.sql(address));
            organization.setWebsite(Sql.sql(website));
            organization.writeToDB();
    }
}

