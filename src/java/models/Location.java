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
public class Location extends DBModel {
    public Location(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "location";
        Person.stdEntryes = new DBEntry[5];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "city_id";
        Person.stdEntryes[1].type = EntryType.Int;
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "address";
        Person.stdEntryes[2].type = EntryType.String;  
        Person.stdEntryes[3] = new DBEntry();
        Person.stdEntryes[3].name = "x_coord";
        Person.stdEntryes[3].type = EntryType.Int;
        Person.stdEntryes[4] = new DBEntry();
        Person.stdEntryes[4].name = "y_coord";
        Person.stdEntryes[4].type = EntryType.Int;    
    }
     public static Location getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Location)Location.getOne(entryes, 1);
    }
    public static Location[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Location[])Location.getAll(entryes, 1);
    }
    public int getId()
    {
        return Integer.parseInt(this.entryes[0].getValue());
    }
    public void setId(int id)
    {
        this.entryes[0].setValue(id);
    }
    public int getCityId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setCityId(int id)
    {
        this.entryes[1].setValue(id);
    }
   public String getAddress()
    {
        return this.entryes[2].getValue();
    }
    public void setAddress(String adress)
    {
        this.entryes[2].setValue(adress);
    }
   public int getXCoord()
    {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    public void setXCoord(int x)
    {
        this.entryes[3].setValue(x);
    }
    public int getYCoord()
    {
        return Integer.parseInt(this.entryes[4].getValue());
    }
    public void setYCoord(int id)
    {
        this.entryes[4].setValue(id);
    }
}
