/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author roma
 */
public class DBModel {    
    protected DBEntry[] entryes; //First element always ID
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    
    public DBModel(DBEntry[] entryes)
    {
        this.entryes = entryes;
    }
    
    public void write() throws ClassNotFoundException, SQLException
    {
        if (DBConnectionHolder.connection == null) DBConnectionHolder.createConnection();
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " +DBConnectionHolder.DBName); 
        String query = "INSERT " + tableName + " SET ";
        for(int i = 0; i < entryes.length;i++)
        {
            query += entryes[i].name + "=" + entryes[i].SQLValue();
            if (i+1<entryes.length) query += ", ";
        }
        st.execute(query);
        st.close();
    }
    public void save() throws ClassNotFoundException, SQLException
    {
        if (DBConnectionHolder.connection == null) DBConnectionHolder.createConnection();
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " +DBConnectionHolder.DBName); 
        String query = "UPDATE " + tableName + " SET ";
        for(int i = 1; i < entryes.length;i++)
        {
            query += entryes[i].name + "=" + entryes[i].SQLValue();
            if (i+1<entryes.length) query += ", ";
        }
        query += " WHERE " + entryes[0].name + "=" + entryes[0].SQLValue();
        st.execute(query);
        st.close();
    }
    
    protected static DBModel getOne( DBEntry[] entryes, int fl) throws ClassNotFoundException, SQLException
    {
        if (DBConnectionHolder.connection == null) DBConnectionHolder.createConnection();
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " +DBConnectionHolder.DBName); 
        String query = "SELECT * FROM " + tableName + " WHERE ";
        for(int i = 1; i < entryes.length; i++)
        {
            query += entryes[i].name + "=" + entryes[i].SQLValue();
            if (i+1<entryes.length) query += ", ";
        }
        DBEntry[] result = new DBEntry[stdEntryes.length];
        try (ResultSet rs = st.executeQuery(query))
        {
            for(int i = 0; i < stdEntryes.length; i++)
            {
               result[i] = new DBEntry();
               result[i].type = stdEntryes[i].type; 
               result[i].setValue(rs.getObject(i)); 
            }
            DBModel ans = new DBModel(result);
            return ans;
        }
    }
    protected static DBModel[] getAll( DBEntry[] entryes, int fl) throws ClassNotFoundException, SQLException
    {
        if (DBConnectionHolder.connection == null) DBConnectionHolder.createConnection();
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " +DBConnectionHolder.DBName); 
        String query = "SELECT * FROM " + tableName + " WHERE ";
        for(int i = 1; i < entryes.length; i++)
        {
            query += entryes[i].name + "=" + entryes[i].SQLValue();
            if (i+1<entryes.length) query += ", ";
        }
        DBEntry[] result = new DBEntry[stdEntryes.length];
        try (ResultSet rs = st.executeQuery(query))
        {
            ArrayList<DBModel> ans = new ArrayList<DBModel>();
            while (rs.next())
            {
                result = new DBEntry[stdEntryes.length];
                for(int i = 0; i < stdEntryes.length; i++)
                {
                    result[i] = new DBEntry();
                    result[i].type = stdEntryes[i].type; 
                    result[i].setValue(rs.getObject(i)); 
                }
                ans.add(new DBModel(result));
            }
            return (DBModel[])ans.toArray();
        }
    }
}
