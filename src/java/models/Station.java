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
    static protected String tableName = "station";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int)
    };
    
    protected Station(DBEntry[] entryes) {
        super(entryes);        
    }
    
    public Station() {
        super();        
    }
    
    public static void init()
    {
    }
     public static Station getOne( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Station.tableName;
        DBModel.stdEntryes = Station.stdEntryes;
        return new Station(Station.getOne(entryes, 1).entryes);
    }
    public static Station[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Station.tableName;
        DBModel.stdEntryes = Station.stdEntryes;
        DBModel[] ans1 = Station.getAll(entryes, 1);
        Station[] ans2 = new Station[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Station(ans1[i].entryes);
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
    public int getLocationId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setLocationId(int id)
    {
        this.entryes[1].setValue(id);
    }
    public int getOrganizationId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[2].setValue(id);
    }
   
}
