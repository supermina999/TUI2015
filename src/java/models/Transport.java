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
public class Transport extends DBModel {
    static protected String tableName = "transport";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("max_weight", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int)
    };
    
    protected Transport(DBEntry[] entryes) {
        super(entryes);        
    }
    
     public Transport() {
        super();        
    }
    
    public static void init()
    {
    }
    
     public static Transport getOne( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Transport.tableName;
        DBModel.stdEntryes = Transport.stdEntryes;
        DBModel buf = Transport.getOne(entryes, 1);
        if (buf != null) return new Transport(buf.entryes);
        else return null;
    }
    public static Transport[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Transport.tableName;
        DBModel.stdEntryes = Transport.stdEntryes;
        DBModel[] ans1 = Transport.getAll(entryes, 1);
        Transport[] ans2 = new Transport[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Transport(ans1[i].entryes);
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
    public String getName()
    {
        return this.entryes[1].getValue();
    }
    public void setName(String name)
    {
        this.entryes[1].setValue(name);
    }
    public int getMaxWeight()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setMaxWeight(int weight)
    {
        this.entryes[2].setValue(weight);
    }
    public int getOrganizationId()
    {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[3].setValue(id);
    }
}
