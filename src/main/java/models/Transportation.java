package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Transportation extends DBModel {

    static protected String tableName = "transportation";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("request_id", EntryType.Int),
        new DBEntry("transport_id", EntryType.Int),
        new DBEntry("time_start", EntryType.String),
        new DBEntry("time_finish", EntryType.String),
        new DBEntry("status", EntryType.Int),
        new DBEntry("safety_id", EntryType.Int)

    };

    protected Transportation(DBEntry[] entryes) {
        super(entryes);

    }

    public Transportation() {
        super();

    }

    public static void init() {

    }

    public static Transportation getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Transportation getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Transportation.tableName;
        DBModel.stdEntryes = Transportation.stdEntryes;
        DBModel buf = Transportation.getOne(entryes, 1);
        if (buf != null) {
            return new Transportation(buf.entryes);
        } else {
            return null;
        }
    }

    public static Transportation[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Transportation.tableName;
        DBModel.stdEntryes = Transportation.stdEntryes;
        DBModel[] ans1 = Transportation.getAll(entryes, 1);
        Transportation[] ans2 = new Transportation[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Transportation(ans1[i].entryes);
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

    public int getRequestId() {
        return Integer.parseInt(this.entryes[1].getValue());
    }

    public void setRequestId(int id) {
        this.entryes[1].setValue(id);
    }

    public int getTransportId() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setTransportId(int id) {
        this.entryes[2].setValue(id);
    }

    public String getTimeStart() throws ParseException {
        return this.entryes[3].getValue();
    }

    public void setTimeStart(String date) {
        this.entryes[3].setValue(date);
    }

    public String getTimeFinish() throws ParseException {
        return this.entryes[4].getValue();
    }

    public void setTimeFinish(String date) {
        this.entryes[4].setValue(date);
    }

    public void setStatus(int id) {
        this.entryes[5].setValue(id);
    }

    public Integer getStatus() {
        return Integer.parseInt(this.entryes[5].getValue());
    }

    public void setSafetyId(int id) {
        this.entryes[6].setValue(id);
    }

    public Integer getSafetyId() {
        return Integer.parseInt(this.entryes[6].getValue());
    }

    public String getStatusName() throws Exception {
        int id = getRequestTypeId();
        if (id == 1) {
            if (getStatus() == 1) {
                return "получено";
            } else {
                return "не получено";
            }
        } else {
            if (getStatus() == 1) {
                return "доставлено";
            } else {
                return "не доставлено";
            }
        }
    }
    
    

    public String getSafetyName() throws Exception {
        int id = getSafetyId();
        return Safety.getOne(id).getName();
    }

    public String getTransportName() throws Exception {
        int id = getTransportId();
        return Transport.getOne(id).getName();
    }

    public String getRequestType() throws Exception {
        int id = getRequestId();
        return Request.getOne(id).getRequestTypeName();
    }

    public String getDriverName() throws Exception {
        int id = getTransportId();
        return Transport.getOne(id).getDriverName();
    }

    public int getDriverId() throws Exception {
        int id = getTransportId();
        return Transport.getOne(id).getPersonId();
    }

    public Location getStockLocation() throws Exception {
        int id = getStockId();
        return Stock.getOne(id).getLocation();
    }

    public Location getFinishLocation() throws Exception {
        int id = getRequestId();
        Request req = Request.getOne(id);
        return Location.getOne(req.getLocationId());
    }

    public Integer getRequestTypeId() throws Exception {
        int id = getRequestId();
        return Request.getOne(id).getRequestTypeId();
    }

    public Integer getResourceNumber() throws Exception {
        int id = getRequestId();
        return Request.getOne(id).getNumber();
    }
    
    public String getResourceMeasureName() throws Exception {
        int id = getRequestId();
        return Request.getOne(id).getMeasureName();
    }
    
    public String getResourceTypeName() throws Exception {
        int id = getRequestId();
        return Request.getOne(id).getResourceName();
    }

    public Integer getStockId() throws Exception {
        int id = getTransportId();
        return Transport.getOne(id).getStockId();
    }
    
    public String getTransportNumber() throws Exception {
        int id = getTransportId();
        return Transport.getOne(id).getNumber();
    }
}
