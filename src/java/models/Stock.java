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
public class Stock extends DBModel {
    static protected String tableName = "stock";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int)
    };
    
    protected Stock(DBEntry[] entryes) {
        super(entryes);        
    }
    
     public Stock() {
        super();        
    }
    
    public static void init()
    {
    }
    
     public static Stock getOne( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Stock.tableName;
        DBModel.stdEntryes = Stock.stdEntryes;
        DBModel buf = Stock.getOne(entryes, 1);
        if (buf != null) return new Stock(buf.entryes);
        else return null;
    }
    public static Stock[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Stock.tableName;
        DBModel.stdEntryes = Stock.stdEntryes;
        DBModel[] ans1 = Stock.getAll(entryes, 1);
        Stock[] ans2 = new Stock[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Stock(ans1[i].entryes);
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
    public int getOrganizationId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[1].setValue(id);
    }
   public int getLocationId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setLocationId(int id)
    {
        this.entryes[2].setValue(id);
    }
}
