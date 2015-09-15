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
    public Stock(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "stock";
        Person.stdEntryes = new DBEntry[3];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "organization_id";
        Person.stdEntryes[1].type = EntryType.Int; 
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "location_id";
        Person.stdEntryes[2].type = EntryType.Int;  
    }
     public static Stock getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Stock)Stock.getOne(entryes, 1);
    }
    public static Stock[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Stock[])Stock.getAll(entryes, 1);
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
