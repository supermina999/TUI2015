<%@page import="javax.swing.JTable"%>
<%@page import="fileXLS.MakeFileXLS"%>
<%@page import="javax.swing.table.TableColumnModel"%>
<%@page import="javax.swing.table.TableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    int tab = 3;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 5) {%>
    <%@include file = "wrongPermission.jsp"%>
<%} else {
    String string_id = request.getParameter("id");
    String string_stock_id = request.getParameter("stock_id");
    int id = Integer.parseInt(string_id);
    int stock_id = Integer.parseInt(string_stock_id);
    String MeasureName;
    String ResourceName;
    DBEntry[] params;
    if (stock_id == -1)
    {
        MeasureName = Resource.getOne(id).getMeasureName();
        ResourceName = Resource.getOne(id).getName();
        params = new DBEntry[1];
        params[0] = new DBEntry("resource_id", EntryType.Int, id);
        AvailableResource[] avRes = AvailableResource.getAll(params);
    }
    else
    {
        MeasureName = AvailableResource.getOne(id).getMeasureName();
        ResourceName = AvailableResource.getOne(id).getResourceName();
        params = new DBEntry[2];
        AvailableResource avRes = AvailableResource.getOne(id);
        params[0] = new DBEntry("resource_id", EntryType.Int, avRes.getResourceId());
        params[1] = new DBEntry("stock_id", EntryType.Int, stock_id);
    }
    History[] history = History.getAll(params);
    if (history.length > 0)
    {        
        String[] columnNames = {"Дата", "Кол-во, " + MeasureName};
        Object[][] data = new Object[history.length][2];
        for (int i = 0; i < history.length; i++)
        {
            data[i][0] = history[i].getDateString();
            data[i][1] = history[i].getNumber();
        }
        JTable jtable = new JTable(data, columnNames);
        MakeFileXLS mfXLS = new MakeFileXLS();
        mfXLS.makeFile(jtable, ResourceName);
    }
%>
<br>
<script>
    var link = "/var/lib/tomcat7/webapps/ROOT/" + <%=ResourceName%> + ".xls";
    window.open(link);
    window.close();
</script>
<%}%>
<%@include file = "layout2.jsp"%>
