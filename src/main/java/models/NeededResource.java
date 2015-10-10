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
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("base_id", EntryType.Int),
        new DBEntry("resource_id", EntryType.Int),
        new DBEntry("number", EntryType.Int),
        new DBEntry("measure_id", EntryType.Int),
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
     public static NeededResource getOne(int id) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }
     public static NeededResource getOne( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = NeededResource.tableName;
        DBModel.stdEntryes = NeededResource.stdEntryes;
        DBModel buf = NeededResource.getOne(entryes, 1);
        if (buf != null) return new NeededResource(buf.entryes);
        else return null;
    }
    public static NeededResource[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = NeededResource.tableName;
        DBModel.stdEntryes = NeededResource.stdEntryes;
        DBModel[] ans1 = NeededResource.getAll(entryes, 1);
        NeededResource[] ans2 = new NeededResource[ans1.length];
        for(int i=0; i<ans1.length; i++) if (ans1[i] != null) ans2[i]=new NeededResource(ans1[i].entryes);
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
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setResourceId(int id)
    {
        this.entryes[2].setValue(id);
    }
   public int getBaseId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setBaseId(int id)
    {
        this.entryes[1].setValue(id);
    }
    public int getNumber()
    {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    public void setNumber(int number)
    {
        this.entryes[3].setValue(number);
    }
    public int getMeasureId()
    {
        return Integer.parseInt(this.entryes[4].getValue());
    }
    public void setMeasureId(int id)
    {
        this.entryes[4].setValue(id);
    }
    public int getEmergency()
    {
        return Integer.parseInt(this.entryes[5].getValue());
    }
    public void setEmergency(int emergency)
    {
        this.entryes[5].setValue(emergency);
    }
    public String getResourceName() throws Exception
    {
        int id = getResourceId();
        return Resource.getOne(id).getName();
    }
    public Location getLocation() throws Exception
    {
        int id = getBaseId();
        return Stock.getOne(id).getLocation();
    }
    public String getMeasureName() throws Exception
    {
        int id = getResourceId();
        return Measure.getOne(id).getName();
    }
}
