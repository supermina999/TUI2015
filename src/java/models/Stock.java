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
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Stock(DBEntry[] entryes) {
        super(entryes);
        
    }
     public Stock() {
        super();
        
    }
    
    public static void init()
    {
        Stock.tableName = "stock";
        Stock.stdEntryes = new DBEntry[3];
        Stock.stdEntryes[0] = new DBEntry();
        Stock.stdEntryes[0].name = "id";
        Stock.stdEntryes[0].type = EntryType.Int;
        Stock.stdEntryes[1] = new DBEntry();
        Stock.stdEntryes[1].name = "organization_id";
        Stock.stdEntryes[1].type = EntryType.Int; 
        Stock.stdEntryes[2] = new DBEntry();
        Stock.stdEntryes[2].name = "location_id";
        Stock.stdEntryes[2].type = EntryType.Int;  
    }
     public static Stock getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Stock.tableName;
        DBModel.stdEntryes = Stock.stdEntryes;
        return new Stock(Stock.getOne(entryes, 1).entryes);
    }
    public static Stock[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
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
    public int getOranizationId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setOranizationId(int id)
    {
        this.entryes[1].setValue(id);
    }
   public int getLocationId()
    {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    public void setLocationId(int id)
    {
        this.entryes[3].setValue(id);
    }
}
