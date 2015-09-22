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
public class Permission extends DBModel {
    static protected String tableName = "permission";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };
    
    protected Permission(DBEntry[] entryes) {
        super(entryes);        
    } 
    
     public Permission() {
        super();        
    }
     
    public static void init()
    {
    }
    
     public static Permission getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Permission.tableName;
        DBModel.stdEntryes = Permission.stdEntryes;
        return new Permission(Permission.getOne(entryes, 1).entryes);
    }
    public static Permission[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Permission.tableName;
        DBModel.stdEntryes = Permission.stdEntryes;
        DBModel[] ans1 = Permission.getAll(entryes, 1);
        Permission[] ans2 = new Permission[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Permission(ans1[i].entryes);
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
    
}
