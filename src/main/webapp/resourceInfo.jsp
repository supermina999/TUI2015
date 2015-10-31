<%@page import="fileXLS.MakeFileXLS"%>
<%@page import="javax.swing.table.TableColumnModel"%>
<%@page import="javax.swing.table.TableModel"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@page import="javax.swing.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    if (stock_id == -1)
    {
        MeasureName = Resource.getOne(id).getMeasureName();
        ResourceName = Resource.getOne(id).getName();
    }
    else
    {
        MeasureName = AvailableResource.getOne(id).getMeasureName();
        ResourceName = AvailableResource.getOne(id).getResourceName();
    }
    int sum_now = 0;
    DBEntry[] params;
    if (stock_id != -1)
    {
        params = new DBEntry[2];
        AvailableResource avRes = AvailableResource.getOne(id);
        sum_now = avRes.getNumber();
        params[0] = new DBEntry("resource_id", EntryType.Int, avRes.getResourceId());
        params[1] = new DBEntry("stock_id", EntryType.Int, stock_id);
    }
    else
    {
        params = new DBEntry[1];
        params[0] = new DBEntry("resource_id", EntryType.Int, id);
    }
    History[] history = History.getAll(params);
    if (stock_id == -1)
    {
        AvailableResource[] avRes = AvailableResource.getAll(params);
        for (int i = 0; i < avRes.length; i++)
            sum_now += avRes[i].getNumber();
    }
    Vector<String> graph_date = new Vector<String>();
    Vector<Integer> number = new Vector<Integer>();
    if (history.length > 0)
    {        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(history[0].getDate().getTime());
        cal.add(Calendar.DATE, -1);
        Date date1 = sdf.parse(sdf.format(cal.getTime()));
        cal.setTimeInMillis(history[history.length - 1].getDate().getTime());
        Date date2 = sdf.parse(sdf.format(cal.getTime()));
        cal.setTime(date1);
        int d = 0;
        int sum = 0;
        while(!date1.after(date2))
        {
            graph_date.add(new SimpleDateFormat("dd.MM.yyyy").format(date1));
            while(d < history.length && date1.getTime() == history[d].getDate().getTime())
            {
                sum += history[d].getNumber();
                d++;
            }
            number.add(sum);
            cal.add(Calendar.DATE, 1);
            date1 = sdf.parse(sdf.format(cal.getTime()));
        }
        for (int i = 1; i < number.size(); i++)
            number.setElementAt(number.elementAt(i) + sum_now - sum, i);
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

<script src="plugins/charts/Chart.js"></script> 
<br>
<div class="form-block center-block" style="width: 50%; min-height: 1000px;">
    <center><h2 class="title"><%=ResourceName%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="form-group col-sm-7">
            <p style="font-size: 15px;"> <b>Кол-во:</b> <%=sum_now%> <%=MeasureName%></p>
            <%if (history.length > 0){%><p style="font-size: 15px;"> <a href="/home/table.xls" download="table.xls"> Скачать таблицу </a></p><%}%>
        </div>
        <%if (history.length > 0){%><canvas class="graph-line" id="myChart1"></canvas><%}%>
    </form>
    <%if (history.length > 0){%>
<script>
        var data1 = {
            labels: ["<%=graph_date.elementAt(0)%>"<%for (int i = 1; i < graph_date.size(); i++) {%>, "<%=graph_date.elementAt(i)%>"<%}%>],
            datasets: [
                    {
                    label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [<%=number.elementAt(0)%><%for (int i = 1; i < number.size(); i++) {%>, <%=number.elementAt(i)%><%}%>]
                    }
                    ]
        };
        window.onload = function() {
                    var ctx = document.getElementById("myChart1").getContext("2d");
                    window.myNewChart = new Chart(ctx).Line(data1, {responsive: true});
        };
</script>
    <%}%>
</div>
<br>
<% } %>
<%@include file = "layout2.jsp"%>