/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

/**
 *
 * @author roma
 */
public class Location extends DBModel {
    static protected String tableName  = "location";
    static protected DBEntry[] stdEntryes ={
        new DBEntry("id", EntryType.Int),
        new DBEntry("city_id", EntryType.Int),
        new DBEntry("address", EntryType.String),
        new DBEntry("x_coord", EntryType.Int),
        new DBEntry("y_coord", EntryType.Int)        
    };
    
    protected Location(DBEntry[] entryes) {
        super(entryes);        
    }
    
    public Location() {
        super();
    }
    
    public static void init()
    {
    }
     public static Location getOne(int id) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }
    public static Location getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException, UnsupportedEncodingException
    {
        DBModel.tableName = Location.tableName;
        DBModel.stdEntryes = Location.stdEntryes;
        DBModel buf = Location.getOne(entryes, 1);
        if (buf != null) return new Location(buf.entryes);
        else return null;
    }
    public static Location[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Location.tableName;
        DBModel.stdEntryes = Location.stdEntryes;
        DBModel[] ans1 = Location.getAll(entryes, 1);
        Location[] ans2 = new Location[ans1.length];
        for(int i=0; i<ans1.length; i++) if (ans1[i] != null) ans2[i]=new Location(ans1[i].entryes);
        return ans2;
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
