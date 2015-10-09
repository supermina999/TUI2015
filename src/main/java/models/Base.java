/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Base extends DBModel {
    static protected String tableName = "bases";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int),
        new DBEntry("date", EntryType.Date),
        new DBEntry("is_station", EntryType.Int),
        new DBEntry("is_stock", EntryType.Int)       
    };
    
    protected Base(DBEntry[] entryes) {
        super(entryes);        
    }
    
     public Base() {
        super();      
    }
    
    public static void init()
    {
    }
     public static Stock getOne(int id) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
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
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[2].setValue(id);
    }
   public int getLocationId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setLocationId(int id)
    {
        this.entryes[1].setValue(id);
    }
    public String getOrganizationName() throws Exception
    {
        int id = getOrganizationId();
        return Organization.getOne(id).getName();
    }
    public Location getLocation() throws Exception
    {
        int id = getLocationId();
        return Location.getOne(id);
    }
    public Date getDate() throws ParseException
    {
        return new SimpleDateFormat("yyyy-MM-dd").parse(this.entryes[3].getValue());
    }
    public void setDate(Date date)
    {
        this.entryes[3].setValue(date);
    }
     public Boolean isStation()
    {
        return this.entryes[4].getValue().equals("1");
    }
    public void makeStation()
    {
         this.entryes[4].setValue(1);       
    }
    public void unmakeStationk()
    {
         this.entryes[4].setValue(0);       
    }
    public Boolean isStock()
    {
        return this.entryes[5].getValue().equals("1");
    }
    public void makeStock()
    {
         this.entryes[5].setValue(1);       
    }
    public void unmakeStock()
    {
         this.entryes[5].setValue(0);       
    }
  
}
