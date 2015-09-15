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
public class City extends DBModel {
    public City(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "city";
        Person.stdEntryes = new DBEntry[3];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "name";
        Person.stdEntryes[1].type = EntryType.String;
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "country_id";
        Person.stdEntryes[2].type = EntryType.Int;        
    }
     public static City getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (City)City.getOne(entryes, 1);
    }
    public static City[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (City[])City.getAll(entryes, 1);
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
    public int getCountyId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setCountyId(int id)
    {
        this.entryes[2].setValue(id);
    }
}
