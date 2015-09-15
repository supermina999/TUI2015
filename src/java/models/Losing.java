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
public class Losing extends DBModel {
    public Losing(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "losing";
        Person.stdEntryes = new DBEntry[4];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "resource_id";
        Person.stdEntryes[1].type = EntryType.Int; 
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "station_id";
        Person.stdEntryes[2].type = EntryType.Int;
        Person.stdEntryes[3] = new DBEntry();
        Person.stdEntryes[3].name = "number";
        Person.stdEntryes[3].type = EntryType.Int;    
    }
     public static Losing getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Losing)Losing.getOne(entryes, 1);
    }
    public static Losing[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Losing[])Losing.getAll(entryes, 1);
    }
    public int getId()
    {
        return Integer.parseInt(this.entryes[0].getValue());
    }
    public void setId(int id)
    {
        this.entryes[0].setValue(id);
    }
    public int getResourceId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setResourceId(int id)
    {
        this.entryes[1].setValue(id);
    }
   public int getStationId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setStationId(int id)
    {
        this.entryes[2].setValue(id);
    }
    public int getNumber()
    {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    public void setNumber(int number)
    {
        this.entryes[3].setValue(number);
    }
}
