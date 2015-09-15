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
public class Resource extends DBModel {
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Resource(DBEntry[] entryes) {
        super(entryes);
        
    }
    public Resource() {
        super();
        
    }
    
    public static void init()
    {
        Resource.tableName = "resource";
        Resource.stdEntryes = new DBEntry[3];
        Resource.stdEntryes[0] = new DBEntry();
        Resource.stdEntryes[0].name = "id";
        Resource.stdEntryes[0].type = EntryType.Int;
        Resource.stdEntryes[1] = new DBEntry();
        Resource.stdEntryes[1].name = "name";
        Resource.stdEntryes[1].type = EntryType.String;
        Resource.stdEntryes[2] = new DBEntry();
        Resource.stdEntryes[2].name = "weight";
        Resource.stdEntryes[2].type = EntryType.Int;        
    }
     public static Resource getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Resource.tableName;
        DBModel.stdEntryes = Resource.stdEntryes;
        return new Resource(Resource.getOne(entryes, 1).entryes);
    }
    public static Resource[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Resource.tableName;
        DBModel.stdEntryes = Resource.stdEntryes;
        DBModel[] ans1 = Resource.getAll(entryes, 1);
        Resource[] ans2 = new Resource[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Resource(ans1[i].entryes);
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
    public int getWeigth()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setWeight(int weight)
    {
        this.entryes[2].setValue(weight);
    }
}
