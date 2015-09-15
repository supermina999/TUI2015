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
public class City extends DBModel {
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected City(DBEntry[] entryes) {
        super(entryes);
        
    }
     public City() {
        super();
        
    }
    
    public static void init()
    {
        City.tableName = "city";
        City.stdEntryes = new DBEntry[3];
        City.stdEntryes[0] = new DBEntry();
        City.stdEntryes[0].name = "id";
        City.stdEntryes[0].type = EntryType.Int;
        City.stdEntryes[1] = new DBEntry();
        City.stdEntryes[1].name = "name";
        City.stdEntryes[1].type = EntryType.String;
        City.stdEntryes[2] = new DBEntry();
        City.stdEntryes[2].name = "country_id";
        City.stdEntryes[2].type = EntryType.Int;        
    }
     public static City getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = City.tableName;
        DBModel.stdEntryes = City.stdEntryes;
        return new City(City.getOne(entryes, 1).entryes);
    }
    public static City[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = City.tableName;
        DBModel.stdEntryes = City.stdEntryes;
        DBModel[] ans1 = City.getAll(entryes, 1);
        City[] ans2 = new City[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new City(ans1[i].entryes);
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
    public int getCountyId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setCountyId(int id)
    {
        this.entryes[2].setValue(id);
    }
}
