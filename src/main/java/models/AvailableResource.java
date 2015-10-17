package models;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;

public class AvailableResource extends DBModel {

    static protected String tableName = "available_resource";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("resource_id", EntryType.Int),
        new DBEntry("stock_id", EntryType.Int),
        new DBEntry("number", EntryType.Int),
        new DBEntry("measure_id", EntryType.Int)
    };

    protected AvailableResource(DBEntry[] entryes) {
        super(entryes);

    }

    public AvailableResource() {
        super();

    }

    public static void init() {
    }

    public static AvailableResource getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static AvailableResource getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = AvailableResource.tableName;
        DBModel.stdEntryes = AvailableResource.stdEntryes;
        DBModel buf = AvailableResource.getOne(entryes, 1);
        if (buf != null) {
            return new AvailableResource(buf.entryes);
        } else {
            return null;
        }
    }

    public static AvailableResource[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = AvailableResource.tableName;
        DBModel.stdEntryes = AvailableResource.stdEntryes;
        DBModel[] ans1 = AvailableResource.getAll(entryes, 1);
        AvailableResource[] ans2 = new AvailableResource[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new AvailableResource(ans1[i].entryes);
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

    public int getResourceId() {
        return Integer.parseInt(this.entryes[1].getValue());
    }

    public void setResourceId(int id) {
        this.entryes[1].setValue(id);
    }

    public int getStockId() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setStockId(int id) {
        this.entryes[2].setValue(id);
    }

    public int getNumber() {
        return Integer.parseInt(this.entryes[3].getValue());
    }

    public void setNumber(int number) {
        this.entryes[3].setValue(number);
    }

    public int getMeasureId() {
        return Integer.parseInt(this.entryes[4].getValue());
    }

    public void setMeasureId(int id) {
        this.entryes[4].setValue(id);
    }

    public String getResourceName() throws Exception {
        int id = getResourceId();
        return Resource.getOne(id).getName();
    }

    public Location getLocation() throws Exception {
        int id = getStockId();
        return Stock.getOne(id).getLocation();
    }

    public String getMeasureName() throws Exception {
        int id = getResourceId();
        return Measure.getOne(id).getName();
    }
}
