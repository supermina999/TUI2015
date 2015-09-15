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
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Organization(DBEntry[] entryes) {
        super(entryes);
        
    }
    public Organization() {
        super();
        
    }
    
    public static void init()
    {
        Organization.tableName = "organization";
        Organization.stdEntryes = new DBEntry[4];
        Organization.stdEntryes[0] = new DBEntry();
        Organization.stdEntryes[0].name = "id";
        Organization.stdEntryes[0].type = EntryType.Int;
        Organization.stdEntryes[1] = new DBEntry();
        Organization.stdEntryes[1].name = "name";
        Organization.stdEntryes[1].type = EntryType.String;
        Organization.stdEntryes[2] = new DBEntry();
        Organization.stdEntryes[2].name = "address";
        Organization.stdEntryes[2].type = EntryType.String;
        Organization.stdEntryes[3] = new DBEntry();
        Organization.stdEntryes[3].name = "website";
        Organization.stdEntryes[3].type = EntryType.String;
        
    }
     public static Organization getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Organization.tableName;
        DBModel.stdEntryes = Organization.stdEntryes;
        return new Organization(Organization.getOne(entryes, 1).entryes);
    }
    public static Organization[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
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
