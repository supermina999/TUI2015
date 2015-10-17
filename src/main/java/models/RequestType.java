package models;

import java.sql.SQLException;

public class RequestType extends DBModel {

    static protected String tableName = "request_type";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };

    protected RequestType(DBEntry[] entryes) {
        super(entryes);
    }

    public RequestType() {
        super();
    }

    public static void init() {
    }

    public static RequestType getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static RequestType getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = RequestType.tableName;
        DBModel.stdEntryes = RequestType.stdEntryes;
        DBModel buf = RequestType.getOne(entryes, 1);
        if (buf != null) {
            return new RequestType(buf.entryes);
        } else {
            return null;
        }
    }

    public static RequestType[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = RequestType.tableName;
        DBModel.stdEntryes = RequestType.stdEntryes;
        DBModel[] ans1 = RequestType.getAll(entryes, 1);
        RequestType[] ans2 = new RequestType[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new RequestType(ans1[i].entryes);
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