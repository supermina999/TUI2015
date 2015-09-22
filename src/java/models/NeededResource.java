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
public class NeededResource extends DBModel {
    static protected String tableName = "needed_resource";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("resource_id", EntryType.Int),
        new DBEntry("station_id", EntryType.Int),
        new DBEntry("number", EntryType.Int),
        new DBEntry("emergency", EntryType.Int)
    };
    
    protected NeededResource(DBEntry[] entryes) {
        super(entryes);
    }
    
    public NeededResource() {
        super();        
    }
    
    public static void init()
    {
    }
     public static NeededResource getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = NeededResource.tableName;
        DBModel.stdEntryes = NeededResource.stdEntryes;
        return new NeededResource(NeededResource.getOne(entryes, 1).entryes);
    }
    public static NeededResource[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = NeededResource.tableName;
        DBModel.stdEntryes = NeededResource.stdEntryes;
        DBModel[] ans1 = NeededResource.getAll(entryes, 1);
        NeededResource[] ans2 = new NeededResource[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new NeededResource(ans1[i].entryes);
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
     public int getEmergency()
    {
        return Integer.parseInt(this.entryes[4].getValue());
    }
    public void setEmergency(int emergency)
    {
        this.entryes[4].setValue(emergency);
    }
}
