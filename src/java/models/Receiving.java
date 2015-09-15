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
public class Receiving extends DBModel {
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Receiving(DBEntry[] entryes) {
        super(entryes);
        
    }
     public Receiving() {
        super();
        
    }
    
    public static void init()
    {
        Receiving.tableName = "receiving";
        Receiving.stdEntryes = new DBEntry[4];
        Receiving.stdEntryes[0] = new DBEntry();
        Receiving.stdEntryes[0].name = "id";
        Receiving.stdEntryes[0].type = EntryType.Int;
        Receiving.stdEntryes[1] = new DBEntry();
        Receiving.stdEntryes[1].name = "resource_id";
        Receiving.stdEntryes[1].type = EntryType.Int; 
        Receiving.stdEntryes[2] = new DBEntry();
        Receiving.stdEntryes[2].name = "stock_id";
        Receiving.stdEntryes[2].type = EntryType.Int;
        Receiving.stdEntryes[3] = new DBEntry();
        Receiving.stdEntryes[3].name = "number";
        Receiving.stdEntryes[3].type = EntryType.Int;    
    }
     public static Receiving getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Receiving.tableName;
        DBModel.stdEntryes = Receiving.stdEntryes;
        return new Receiving(Receiving.getOne(entryes, 1).entryes);
    }
    public static Receiving[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Receiving.tableName;
        DBModel.stdEntryes = Receiving.stdEntryes;
        DBModel[] ans1 = Receiving.getAll(entryes, 1);
        Receiving[] ans2 = new Receiving[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Receiving(ans1[i].entryes);
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
   public int getStockId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setStockId(int id)
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
