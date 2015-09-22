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
public class Organization extends DBModel {
    static protected String tableName = "organization";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("address", EntryType.String),
        new DBEntry("website", EntryType.String)        
    };
    protected Organization(DBEntry[] entryes) {
        super(entryes);        
    }
    
    public Organization() {
        super();        
    }
    
    public static void init()
    {
    }
    
     public static Organization getOne( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Organization.tableName;
        DBModel.stdEntryes = Organization.stdEntryes;
        return new Organization(Organization.getOne(entryes, 1).entryes);
    }
    public static Organization[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Organization.tableName;
        DBModel.stdEntryes = Organization.stdEntryes;
        DBModel[] ans1 = Organization.getAll(entryes, 1);
        Organization[] ans2 = new Organization[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Organization(ans1[i].entryes);
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
    public String getAddress()
    {
        return this.entryes[2].getValue();
    }
    public void setAddress(String adress)
    {
        this.entryes[2].setValue(adress);
    }
    public String getWebsite()
    {
        return this.entryes[3].getValue();
    }
    public void setWebsite(String website)
    {
        this.entryes[3].setValue(website);
    }
}
