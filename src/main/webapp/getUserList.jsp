<%@page import="models.*, java.util.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    ArrayList<DBEntry> params = new ArrayList<>();
    DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("surname", EntryType.String),
        new DBEntry("second_name", EntryType.String),
        new DBEntry("login", EntryType.String),
        new DBEntry("password", EntryType.String),
        new DBEntry("city_id", EntryType.Int),
        new DBEntry("address", EntryType.String),
        new DBEntry("phone", EntryType.String),
        new DBEntry("email", EntryType.String),
        new DBEntry("permission_id", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int)
    };
    for (int i = 0; i < stdEntryes.length; i++)
    {
        String name = stdEntryes[i].name;
        EntryType type = stdEntryes[i].type;
        Object value = request.getParameter(name);
        if (value != null)
        {
            if (type == EntryType.Int) value = Integer.parseInt((String)value);
            params.add(new DBEntry(name, type, value));
        }
    }
    DBEntry[] paramsM = params.toArray(new DBEntry[params.size()]);
    if (params.size() == 0) paramsM = null;
    Person[] res = Person.getAll(paramsM);
    int n = res.length;
    %><%=n%>
<%
    for (int i = 0; i < n; i++)
    {       
   %><%=res[i].getName()%>
<%=res[i].getSurname()%>
<%=res[i].getSecondName()%>
<%=res[i].getAddress()%>
<%=res[i].getCityName()%>
<%=res[i].getEmail()%>
<%=res[i].getPhone()%>
<%=res[i].getPermissionName()%>
<%=res[i].getOrganizationName()%>
<%
    }
%>