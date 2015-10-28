package models;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;

public class Location extends DBModel {

    static protected String tableName = "location";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("region_id", EntryType.Int),
        new DBEntry("address", EntryType.String),
        new DBEntry("x_coord", EntryType.Double),
        new DBEntry("y_coord", EntryType.Double)
    };

    protected Location(DBEntry[] entryes) {
        super(entryes);
    }

    public Location() {
        super();
    }

    public static void init() {
    }

    public static Location getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Location getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Location.tableName;
        DBModel.stdEntryes = Location.stdEntryes;
        DBModel buf = Location.getOne(entryes, 1);
        if (buf != null) {
            return new Location(buf.entryes);
        } else {
            return null;
        }
    }

    public static Location[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Location.tableName;
        DBModel.stdEntryes = Location.stdEntryes;
        DBModel[] ans1 = Location.getAll(entryes, 1);
        Location[] ans2 = new Location[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Location(ans1[i].entryes);
            }
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }

    public int getRegionId() {
        return Integer.parseInt(this.entryes[1].getValue());
    }

    public void setRegionId(int id) {
        this.entryes[1].setValue(id);
    }

    public String getAddress() {
        return this.entryes[2].getValue();
    }

    public void setAddress(String adress) {
        this.entryes[2].setValue(adress);
    }

    public double getXCoord() {
        return Double.parseDouble(this.entryes[3].getValue());
    }

    public void setXCoord(double x) {
        this.entryes[3].setValue(x);
    }

    public double getYCoord() {
        return Double.parseDouble(this.entryes[4].getValue());
    }

    public void setYCoord(double id) {
        this.entryes[4].setValue(id);
    }

    public String getCountryName() throws Exception {
        int id = getRegionId();
        return Region.getOne(id).getCountryName();
    }

    public String getRegionName() throws Exception {
        int id = getRegionId();
        return Region.getOne(id).getName();
    }
    
    public String getFullAddress() throws Exception {
        return getAddress() + ", " + getRegionName() + ", " + getCountryName();
    }
    
    public int onMapId = -1;
}
