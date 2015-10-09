<%@page import="models.*, java.util.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    ArrayList<DBEntry> params = new ArrayList<>();
   DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("weight", EntryType.Int)
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
    Resource[] res = Resource.getAll(paramsM);
    int n = res.length;
    for (int i = 0; i < n; i++)
    {      
        if (i!=0) {%><%="////"%><%}%><%=res[i].getId()%>
<%=res[i].getName()%>
<%=res[i].getWeight()%>
<%
    }
%>