/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.SQLException;

/**
 *
 * @author roma
 */
public class Organization extends DBModel {
    public Organization(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "person";
        Person.stdEntryes = new DBEntry[4];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "name";
        Person.stdEntryes[1].type = EntryType.String;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "address";
        Person.stdEntryes[1].type = EntryType.String;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "website";
        Person.stdEntryes[1].type = EntryType.String;
        
    }
     public static Organization getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Organization)Organization.getOne(entryes, 1);
    }
    public static Organization[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Organization[])Organization.getAll(entryes, 1);
    }
    public int getId()
    {
        return Integer.parseInt(this.entryes[0].getValue());
    }
    public void setId(int id)
    {
        this.entryes[0].setValue(id);
    }
    public String getName()
    {
        return this.entryes[1].getValue();
    }
    public void setName(String name)
    {
        this.entryes[1].setValue(name);
    }
    public String getAddress()
    {
        return this.entryes[2].getValue();
    }
    public void setAddress(String adress)
    {
        this.entryes[2].setValue(adress);
    }
    public String getWebsite()
    {
        return this.entryes[3].getValue();
    }
    public void setWebsite(String website)
    {
        this.entryes[3].setValue(website);
    }
}
