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
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Location(DBEntry[] entryes) {
        super(entryes);
        
    }
    public Location() {
        super();
        
    }
    
    public static void init()
    {
        Location.tableName = "location";
        Location.stdEntryes = new DBEntry[5];
        Location.stdEntryes[0] = new DBEntry();
        Location.stdEntryes[0].name = "id";
        Location.stdEntryes[0].type = EntryType.Int;
        Location.stdEntryes[1] = new DBEntry();
        Location.stdEntryes[1].name = "city_id";
        Location.stdEntryes[1].type = EntryType.Int;
        Location.stdEntryes[2] = new DBEntry();
        Location.stdEntryes[2].name = "address";
        Location.stdEntryes[2].type = EntryType.String;  
        Location.stdEntryes[3] = new DBEntry();
        Location.stdEntryes[3].name = "x_coord";
        Location.stdEntryes[3].type = EntryType.Int;
        Location.stdEntryes[4] = new DBEntry();
        Location.stdEntryes[4].name = "y_coord";
        Location.stdEntryes[4].type = EntryType.Int;    
    }
    public static Location getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Location.tableName;
        DBModel.stdEntryes = Location.stdEntryes;
        return new Location(Location.getOne(entryes, 1).entryes);
    }
    public static Location[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Location.tableName;
        DBModel.stdEntryes = Location.stdEntryes;
        DBModel[] ans1 = Location.getAll(entryes, 1);
        Location[] ans2 = new Location[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Location(ans1[i].entryes);
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
