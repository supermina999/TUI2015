package models;

public class Application extends DBModel {

    static protected String tableName = "application";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("info", EntryType.String),
        new DBEntry("full_name", EntryType.String),
        new DBEntry("phone", EntryType.Int),
        new DBEntry("requets_type_id", EntryType.Int),
        new DBEntry("status_id", EntryType.Int)
    };

    protected Application(DBEntry[] entryes) {
        super(entryes);
    }

    public Application() {
        super();
    }

    public static void init() {
    }

    public static Application getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Application getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Application.tableName;
        DBModel.stdEntryes = Application.stdEntryes;
        DBModel buf = Application.getOne(entryes, 1);
        if (buf != null) {
            return new Application(buf.entryes);
        } else {
            return null;
        }

    }

    public static Application[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Application.tableName;
        DBModel.stdEntryes = Application.stdEntryes;
        DBModel[] ans1 = Application.getAll(entryes, 1);
        Application[] ans2 = new Application[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new Application(ans1[i].entryes);
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }

    public String getInfo() {
        return this.entryes[1].getValue();
    }

    public void setInfo(String info) {
        this.entryes[1].setValue(info);
    }
    
    public String getFullName() {
        return this.entryes[2].getValue();
    }

    public void setFullName(String info) {
        this.entryes[2].setValue(info);
    }
    
    public String getPhone() {
        return this.entryes[3].getValue();
    }

    public void setPhone(String phone) {
        this.entryes[3].setValue(phone);
    }
    
    public String getEmail() {
        return this.entryes[4].getValue();
    }

    public void setEmail(String email) {
        this.entryes[4].setValue(email);
    }
    
    public void setRequestTypeId(int id) {
        this.entryes[5].setValue(id);
    }

    public Integer getsetRequestTypeId() {
        return Integer.parseInt(this.entryes[5].getValue());
    }
    
    public void setStatusId(int id) {
        this.entryes[6].setValue(id);
    }

    public Integer getStatusId() {
        return Integer.parseInt(this.entryes[6].getValue());
    }
}
