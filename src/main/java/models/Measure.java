package models;

import java.sql.SQLException;

public class Measure extends DBModel {

    static protected String tableName = "measure";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };

    protected Measure(DBEntry[] entryes) {
        super(entryes);

    }

    public Measure() {
        super();

    }

    public static void init() {
    }

    public static Measure getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Measure getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Measure.tableName;
        DBModel.stdEntryes = Measure.stdEntryes;
        DBModel buf = Measure.getOne(entryes, 1);
        if (buf != null) {
            return new Measure(buf.entryes);
        } else {
            return null;
        }
    }

    public static Measure[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Measure.tableName;
        DBModel.stdEntryes = Measure.stdEntryes;
        DBModel[] ans1 = Measure.getAll(entryes, 1);
        Measure[] ans2 = new Measure[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Measure(ans1[i].entryes);
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

    public String getName() {
        return this.entryes[1].getValue();
    }

    public void setName(String name) {
        this.entryes[1].setValue(name);
    }
}
