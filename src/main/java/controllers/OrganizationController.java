package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Date;
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
            Date date = new Date();
            Organization organization = new Organization();
            organization.setName(Sql.sql(name));
            organization.setAddress(Sql.sql(address));
            organization.setWebsite(Sql.sql(website));
            organization.setDate(date);
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
            Date date = Organization.getOne(Integer.parseInt(id)).getDate();
            Organization organization = new Organization();
            organization.setId(Integer.parseInt(id));
            organization.setName(Sql.sql(name));
            organization.setAddress(Sql.sql(address));
            organization.setWebsite(Sql.sql(website));
            organization.setDate(date);
            organization.saveChanges();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
            String id = request.getParameter("id");
            Organization organization = new Organization();
            Organization org = Organization.getOne(Integer.parseInt(id));
            organization.setName(org.getName());
            organization.setId(Integer.parseInt(id));
            organization.setAddress(org.getAddress());
            organization.setWebsite(org.getWebsite());
            organization.delete();
    }
   
}
