/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;

/**
 *
 * @author roma
 */
public class City extends DBModel {
    static protected String tableName = "city";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int), 
        new DBEntry("name",EntryType.String),
        new DBEntry("country_id",EntryType.Int)
    };
    protected City(DBEntry[] entryes) {
        super(entryes);
        
    }
     public City() {
        super();
        
    }
    
    public static void init()
    {
           
    }
     public static City getOne(int id) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }
     public static City getOne( DBEntry[] entryes) throws Exception {
        DBModel.tableName = City.tableName;
        DBModel.stdEntryes = City.stdEntryes;
        DBModel buf = City.getOne(entryes, 1);
        if (buf != null) return new City(buf.entryes);
        else return null;
    }
    public static City[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = City.tableName;
        DBModel.stdEntryes = City.stdEntryes;
        DBModel[] ans1 = City.getAll(entryes, 1);
        City[] ans2 = new City[ans1.length];
        for(int i=0; i<ans1.length; i++) if (ans1[i] != null) ans2[i]=new City(ans1[i].entryes);
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
    public int getCountryId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setCountryId(int id)
    {
        this.entryes[2].setValue(id);
    }
    public String getCountryName() throws Exception
    {
        int id = getCountryId();
        return Country.getOne(id).getName();
    }
}
