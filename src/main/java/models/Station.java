/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 *
 * @author roma
 */
public class Station extends DBModel {
    static protected String tableName = "bases";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int),
        new DBEntry("date", EntryType.Date)
    };
    
    protected Station(DBEntry[] entryes) {
        super(entryes);        
    }
    
    public Station() {
        super();    
        List<DBEntry> params;
        if (entryes == null) params = new ArrayList<>();
        else params = Arrays.asList(entryes);
        params = new ArrayList<>(params);
        params.add(new DBEntry("is_station", EntryType.Int, 1));
        entryes = params.toArray(new DBEntry[params.size()]);
    }
    
    public static void init()
    {
    }
     public static Station getOne(int id) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }
     public static Station getOne( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Station.tableName;
        DBModel.stdEntryes = Station.stdEntryes;
        List<DBEntry> params;
        if (entryes == null) params = new ArrayList<>();
        else params = Arrays.asList(entryes);
        params = new ArrayList<>(params);
        params.add(new DBEntry("is_station", EntryType.Int, 1));
        entryes = params.toArray(new DBEntry[params.size()]);
        DBModel buf = Station.getOne(entryes, 1);
        if (buf != null) return new Station(buf.entryes);
        else return null;
    }
    public static Station[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Station.tableName;
        DBModel.stdEntryes = Station.stdEntryes;
        List<DBEntry> params;
        if (entryes == null) params = new ArrayList<>();
        else params = Arrays.asList(entryes);
        params = new ArrayList<>(params);
        params.add(new DBEntry("is_station", EntryType.Int, 1));
        entryes = params.toArray(new DBEntry[params.size()]);
        DBModel[] ans1 = Station.getAll(entryes, 1);
        Station[] ans2 = new Station[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Station(ans1[i].entryes);
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
    public int getLocationId()
    {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    public void setLocationId(int id)
    {
        this.entryes[1].setValue(id);
    }
    public int getOrganizationId()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[2].setValue(id);
    }
    public String getOrganizationName() throws Exception
    {
        int id = getOrganizationId();
        return Organization.getOne(id).getName();
    }
    public Location getLocation() throws Exception
    {
        int id = getLocationId();
        return Location.getOne(id);
    }
    public Date getDate() throws ParseException
    {
        return new SimpleDateFormat("yyyy-MM-dd").parse(this.entryes[3].getValue());
    }
    public void setDate(Date date)
    {
        this.entryes[3].setValue(date);
    }
}
