package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;


public class OrganizationController
{
    public static void add(HttpServletRequest request) throws Exception
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
    public static Person[] getPersons(int id) throws Exception
    {
        DBEntry[] personParams = {
            new DBEntry("organization_id", EntryType.Int, id)
        }; 
        Person[] persons = Person.getAll(personParams); 
        return persons;
    }
    public static void update(HttpServletRequest request) throws Exception
    {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String website = request.getParameter("website");
            Organization organization = new Organization();
            organization.setId(Integer.parseInt(id));
            organization.setName(Sql.sql(name));
            organization.setAddress(Sql.sql(address));
            organization.setWebsite(Sql.sql(website));
            organization.saveChanges();
    }
   
}
