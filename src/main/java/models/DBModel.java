package models;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.text.ParseException;
import java.util.ArrayList;

public class DBModel {

    protected DBEntry[] entryes; //First element always ID
    static protected String tableName;
    static public DBEntry[] stdEntryes;

    public DBModel() {
        this.getRealStatics();
        entryes = new DBEntry[DBModel.stdEntryes.length];
        for (int i = 0; i < entryes.length; i++) {
            entryes[i] = new DBEntry();
            entryes[i].name = DBModel.stdEntryes[i].name;
            entryes[i].type = DBModel.stdEntryes[i].type;
        }
    }

    protected DBModel(DBEntry[] entryes) {
        this.entryes = entryes;
    }

    public void updateEntry(DBEntry entry, String val) {
        for (int i = 0; i < entryes.length; i++) {
            if (entryes[i].name.equals(entry.name)) {
                entryes[i].setValue((entry.type == EntryType.Int) ? Integer.parseInt(val) : (entry.type == EntryType.Double) ? Double.parseDouble(val) : val);
            }
        }
    }

    private void getRealStatics() {
        if (this.getClass() == Person.class) {
            DBModel.tableName = Person.tableName;
            DBModel.stdEntryes = Person.stdEntryes;
        }
        if (this.getClass() == Application.class) {
            DBModel.tableName = Application.tableName;
            DBModel.stdEntryes = Application.stdEntryes;
        }
        if (this.getClass() == Region.class) {
            DBModel.tableName = Region.tableName;
            DBModel.stdEntryes = Region.stdEntryes;
        }
        if (this.getClass() == Request.class) {
            DBModel.tableName = Request.tableName;
            DBModel.stdEntryes = Request.stdEntryes;
        }
        if (this.getClass() == RequestType.class) {
            DBModel.tableName = RequestType.tableName;
            DBModel.stdEntryes = RequestType.stdEntryes;
        }
        if (this.getClass() == Safety.class) {
            DBModel.tableName = Safety.tableName;
            DBModel.stdEntryes = Safety.stdEntryes;
        }
        if (this.getClass() == Transportation.class) {
            DBModel.tableName = Transportation.tableName;
            DBModel.stdEntryes = Transportation.stdEntryes;
        }
        if (this.getClass() == AvailableResource.class) {
            DBModel.tableName = AvailableResource.tableName;
            DBModel.stdEntryes = AvailableResource.stdEntryes;
        }
        if (this.getClass() == Country.class) {
            DBModel.tableName = Country.tableName;
            DBModel.stdEntryes = Country.stdEntryes;
        }
        if (this.getClass() == Location.class) {
            DBModel.tableName = Location.tableName;
            DBModel.stdEntryes = Location.stdEntryes;
        }
        if (this.getClass() == Permission.class) {
            DBModel.tableName = Permission.tableName;
            DBModel.stdEntryes = Permission.stdEntryes;
        }
        if (this.getClass() == Measure.class) {
            DBModel.tableName = Measure.tableName;
            DBModel.stdEntryes = Measure.stdEntryes;
        }
        if (this.getClass() == Resource.class) {
            DBModel.tableName = Resource.tableName;
            DBModel.stdEntryes = Resource.stdEntryes;
        }
        if (this.getClass() == Stock.class) {
            DBModel.tableName = Stock.tableName;
            DBModel.stdEntryes = Stock.stdEntryes;
        }
        if (this.getClass() == Transport.class) {
            DBModel.tableName = Transport.tableName;
            DBModel.stdEntryes = Transport.stdEntryes;
        }
        if (this.getClass() == TransportType.class) {
            DBModel.tableName = TransportType.tableName;
            DBModel.stdEntryes = TransportType.stdEntryes;
        }
    }

    public void writeToDB() throws Exception {
        getRealStatics();
        if (DBConnectionHolder.connection == null || DBConnectionHolder.connection.isClosed()) {
            DBConnectionHolder.createConnection();
        }
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " + DBConnectionHolder.DBName);
        st.execute("SET NAMES utf8");
        String query = "INSERT " + this.tableName + " SET ";
        for (int i = 1; i < entryes.length; i++) {
            query += entryes[i].name + "=" + entryes[i].SQLValue();
            if (i + 1 < entryes.length) {
                query += ", ";
            }
        }
        st.execute(query);
        st.close();
    }

    public void saveChanges() throws ClassNotFoundException, SQLException, UnsupportedEncodingException, ParseException {
        getRealStatics();
        if (DBConnectionHolder.connection == null || DBConnectionHolder.connection.isClosed()) {
            DBConnectionHolder.createConnection();
        }
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " + DBConnectionHolder.DBName);
        st.execute("SET NAMES utf8");
        String query = "UPDATE " + this.tableName + " SET ";
        for (int i = 1; i < entryes.length; i++) {

            query += entryes[i].name + " = " + entryes[i].SQLValue();
            if (i + 1 < entryes.length) {
                query += ", ";
            }
        }
        query += " WHERE " + entryes[0].name + "=" + entryes[0].SQLValue();
        st.execute(query);
        st.close();
    }

    public void delete() throws ClassNotFoundException, SQLException, UnsupportedEncodingException, ParseException {
        getRealStatics();
        if (DBConnectionHolder.connection == null || DBConnectionHolder.connection.isClosed()) {
            DBConnectionHolder.createConnection();
        }
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " + DBConnectionHolder.DBName);
        st.execute("SET NAMES utf8");
        String query = "DELETE FROM " + this.tableName + " WHERE ";
        for (int i = 0; i < 1; i++) {
            query += entryes[i].name + "=" + entryes[i].SQLValue();
            //if (i+1<entryes.length) query += " AND ";
        }
        st.execute(query);
        st.close();
    }

    protected static DBModel getOne(DBEntry[] entryes, int fl) throws Exception {
        if (DBConnectionHolder.connection == null || DBConnectionHolder.connection.isClosed()) {
            DBConnectionHolder.createConnection();
        }
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " + DBConnectionHolder.DBName);
        st.execute("SET NAMES utf8");
        String query = "SELECT * FROM " + tableName;
        if (entryes != null) {
            query += " WHERE ";
            for (int i = 0; i < entryes.length; i++) {
                query += entryes[i].name + "=" + entryes[i].SQLValue();
                if (i + 1 < entryes.length) {
                    query += " AND ";
                }
            }
        }
        DBEntry[] result = new DBEntry[stdEntryes.length];
        try (ResultSet rs = st.executeQuery(query)) {
            if (rs.next()) {
                for (int i = 0; i < stdEntryes.length; i++) {
                    result[i] = new DBEntry();
                    result[i].type = stdEntryes[i].type;
                    result[i].name = stdEntryes[i].name;
                    result[i].setValue(rs.getObject(i + 1));
                }
                DBModel ans = new DBModel(result);
                return ans;
            }
        }
        return null;
    }

    protected static DBModel[] getAll(DBEntry[] entryes, int fl) throws Exception {

        if (DBConnectionHolder.connection == null || DBConnectionHolder.connection.isClosed()) {
            DBConnectionHolder.createConnection();
        }
        Statement st = DBConnectionHolder.connection.createStatement();
        st.execute("use " + DBConnectionHolder.DBName);
        st.execute("SET NAMES utf8");
        String query = "SELECT * FROM " + tableName;
        if (entryes != null) {
            query += " WHERE ";
            for (int i = 0; i < entryes.length; i++) {
                query += entryes[i].name + "=" + entryes[i].SQLValue();
                if (i + 1 < entryes.length) {
                    query += " AND ";
                }
            }
        }
        DBEntry[] result = new DBEntry[stdEntryes.length];
        try (ResultSet rs = st.executeQuery(query)) {
            ArrayList<DBModel> ans = new ArrayList<DBModel>();
            while (rs.next()) {
                result = new DBEntry[stdEntryes.length];
                for (int i = 0; i < stdEntryes.length; i++) {
                    result[i] = new DBEntry();
                    result[i].type = stdEntryes[i].type;
                    result[i].name = stdEntryes[i].name;
                    result[i].setValue(rs.getObject(i + 1));
                }
                ans.add(new DBModel(result));
            }
            return ans.toArray(new DBModel[ans.size()]);
        }
    }
}
