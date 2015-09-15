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
public class Station extends DBModel {
    public Station(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "station";
        Person.stdEntryes = new DBEntry[2];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "location_id";
        Person.stdEntryes[1].type = EntryType.Int;
    }
     public static Station getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Station)Station.getOne(entryes, 1);
    }
    public static Station[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Station[])Station.getAll(entryes, 1);
    }
    public int getId()
    {
        return Integer.parseInt(this.entryes[0].getValue());
    }
    public void setId(int id)
    {
        this.entryes[0].setValue(id);
    }
    public int getLocationId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setLoactionId(int id)
    {
        this.entryes[1].setValue(id);
    }
   
}
