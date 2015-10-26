package models;

public class Transport extends DBModel {

    static protected String tableName = "transport";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("type_id", EntryType.Int),
        new DBEntry("number", EntryType.String),
        new DBEntry("person_id", EntryType.Int),
        new DBEntry("stock_id", EntryType.Int)
    };

    protected Transport(DBEntry[] entryes) {
        super(entryes);
    }

    public Transport() {
        super();
    }

    public static void init() {
    }

    public static Transport getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Transport getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Transport.tableName;
        DBModel.stdEntryes = Transport.stdEntryes;
        DBModel buf = Transport.getOne(entryes, 1);
        if (buf != null) {
            return new Transport(buf.entryes);
        } else {
            return null;
        }

    }

    public static Transport[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Transport.tableName;
        DBModel.stdEntryes = Transport.stdEntryes;
        DBModel[] ans1 = Transport.getAll(entryes, 1);
        Transport[] ans2 = new Transport[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new Transport(ans1[i].entryes);
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }

    public Integer getTypeId() {
        return Integer.parseInt(this.entryes[1].getValue());
    }

    public void setTypeId(int id) {
        this.entryes[1].setValue(id);
    }
    
    public String getNumber() {
        return this.entryes[2].getValue();
    }

    public void setNumber(String name) {
        this.entryes[2].setValue(name);
    }
    
    public int getPersonId() {
        return Integer.parseInt(this.entryes[3].getValue());
    }

    public void setPersonId(int id) {
        this.entryes[3].setValue(id);
    }
    
    public String getDriverName() throws Exception {
        int id = getPersonId();
        Person driver = Person.getOne(id);
        return driver.getSurname() + ' ' + driver.getName() + ' ' + driver.getSecondName();
    }
    
    public int getStockId() {
        return Integer.parseInt(this.entryes[4].getValue());
    }
    
    public Location getStockLocation() throws Exception {
        int id = getStockId();
        return Stock.getOne(id).getLocation();
    }

    public void setStockId(int id) {
        this.entryes[4].setValue(id);
    }
    
    public Integer getMaxWeight() throws Exception {
        int id = getTypeId();
        return TransportType.getOne(id).getMaxWeight();
    }
    
    public Integer getSpeed() throws Exception {
        int id = getTypeId();
        return TransportType.getOne(id).getSpeed();
    }
    
    public String getName() throws Exception {
        int id = getTypeId();
        return TransportType.getOne(id).getName();
    }
    
    public String getStockAddress () throws Exception {
        return getStockLocation().getFullAddress();
    }
}
