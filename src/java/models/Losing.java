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
    static protected String tableName = "losing";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("resource_id", EntryType.Int),
        new DBEntry("station_id", EntryType.Int),
        new DBEntry("number", EntryType.Int)
    };
    protected Losing(DBEntry[] entryes) {
        super(entryes);      
    }
     public Losing() {
        super();
    }
    
    public static void init()
    {
    }
     public static Losing getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Losing.tableName;
        DBModel.stdEntryes = Losing.stdEntryes;
        return new Losing(Losing.getOne(entryes, 1).entryes);
    }
    public static Losing[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Losing.tableName;
        DBModel.stdEntryes = Losing.stdEntryes;
        DBModel[] ans1 = Losing.getAll(entryes, 1);
        Losing[] ans2 = new Losing[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Losing(ans1[i].entryes);
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
}
