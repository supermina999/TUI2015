package models;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Resource extends DBModel {

    static protected String tableName = "resource";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("weight", EntryType.Int),
        new DBEntry("measure_id", EntryType.Int)
    };

    protected Resource(DBEntry[] entryes) {
        super(entryes);
    }

    public Resource() {
        super();
    }

    public static void init() {
    }

    public static Resource getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Resource getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Resource.tableName;
        DBModel.stdEntryes = Resource.stdEntryes;
        DBModel buf = Resource.getOne(entryes, 1);
        if (buf != null) {
            return new Resource(buf.entryes);
        } else {
            return null;
        }
    }

    public static Resource[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Resource.tableName;
        DBModel.stdEntryes = Resource.stdEntryes;
        DBModel[] ans1 = Resource.getAll(entryes, 1);
        Resource[] ans2 = new Resource[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new Resource(ans1[i].entryes);
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }

    public String getName() {
        return this.entryes[1].getValue();
    }

    public void setName(String name) {
        this.entryes[1].setValue(name);
    }

    public int getWeight() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setWeight(int weight) {
        this.entryes[2].setValue(weight);
    }
    
    public int getMeasureId() {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    
    public void setMeasureId(int id) {
        this.entryes[3].setValue(id);
    }
    
    public String getMeasureName() throws Exception {
        int id = getMeasureId();
        return Measure.getOne(id).getName();
    }
}
