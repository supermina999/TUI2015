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
public class AvailableResource extends DBModel {
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected AvailableResource(DBEntry[] entryes) {
        super(entryes);
        
    }
    public AvailableResource() {
        super();
     
    }
    public static void init()
    {
        AvailableResource.tableName = "available_resource";
        AvailableResource.stdEntryes = new DBEntry[5];
        AvailableResource.stdEntryes[0] = new DBEntry();
        AvailableResource.stdEntryes[0].name = "id";
        AvailableResource.stdEntryes[0].type = EntryType.Int;
        AvailableResource.stdEntryes[1] = new DBEntry();
        AvailableResource.stdEntryes[1].name = "resource_id";
        AvailableResource.stdEntryes[1].type = EntryType.Int; 
        AvailableResource.stdEntryes[2] = new DBEntry();
        AvailableResource.stdEntryes[2].name = "stock_id";
        AvailableResource.stdEntryes[2].type = EntryType.Int;
        AvailableResource.stdEntryes[3] = new DBEntry();
        AvailableResource.stdEntryes[3].name = "number";
        AvailableResource.stdEntryes[3].type = EntryType.Int;
        AvailableResource.stdEntryes[4] = new DBEntry();
        AvailableResource.stdEntryes[4].name = "measure_id";
        AvailableResource.stdEntryes[4].type = EntryType.Int;
    }
    public static AvailableResource getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = AvailableResource.tableName;
        DBModel.stdEntryes = AvailableResource.stdEntryes;
        return new AvailableResource(AvailableResource.getOne(entryes, 1).entryes);
    }
    public static AvailableResource[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = AvailableResource.tableName;
        DBModel.stdEntryes = AvailableResource.stdEntryes;
        DBModel[] ans1 = AvailableResource.getAll(entryes, 1);
        AvailableResource[] ans2 = new AvailableResource[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new AvailableResource(ans1[i].entryes);
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
    public int getMeasureId()
    {
        return Integer.parseInt(this.entryes[4].getValue());
    }
    public void setMeasureId(int id)
    {
        this.entryes[4].setValue(id);
    }
}
