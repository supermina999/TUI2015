<%@page import="fileXLS.MakeFileXLS"%>
<%@page import="javax.swing.table.TableColumnModel"%>
<%@page import="javax.swing.table.TableModel"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@page import="javax.swing.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 3;
    String string_id = request.getParameter("id");
    String string_stock_id = request.getParameter("stock_id");
    int id = Integer.parseInt(string_id);
    int stock_id = Integer.parseInt(string_stock_id);
    AvailableResource avRes = AvailableResource.getOne(id);
    DBEntry[] params = {
        new DBEntry("resource_id", EntryType.Int, avRes.getResourceId()),
        new DBEntry("status", EntryType.Int, 1)
    };
    Request[] req = Request.getAll(params);
    Vector<String> graph_date = new Vector<String>();
    Vector<Integer> number = new Vector<Integer>();
    Vector<Long> date = new Vector<Long>();
        Vector<Integer> numb = new Vector<Integer>();
    //graph_date.add("0000-00-00");
    //number.add(0);
    if (req.length > 0)
    {        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = 0; i < req.length; i++)
        {
            DBEntry[] params2 = {
                new DBEntry("request_id", EntryType.Int, req[i].getId())
            };
            Transportation[] tr = Transportation.getAll(params2);
            if (tr.length > 0 && tr[0].getStockId() == stock_id)
            {
                date.add(req[i].getDate().getTime());
                if (req[i].getRequestTypeId() == 1)
                    numb.add(req[i].getNumber() * -1);
                else
                    numb.add(req[i].getNumber());
            }
        }
        if (date.size() > 0)
        {
            for (int i = 0; i < date.size() - 1; i++)
                for (int j = 0; j < date.size() - i; j++)
                    if (date.elementAt(j) > date.elementAt(j + 1))
                    {
                        long ind1 = date.elementAt(j);
                        date.setElementAt(date.elementAt(j + 1), j);
                        date.setElementAt(ind1, j + 1);
                        int ind2 = numb.elementAt(j);
                        numb.setElementAt(numb.elementAt(j + 1), j);
                        numb.setElementAt(ind2, j + 1);
                    }
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(date.elementAt(0));
            cal.add(Calendar.DATE, -1);
            Date date1 = sdf.parse(sdf.format(cal.getTime()));
            cal.setTimeInMillis(date.elementAt(date.size() - 1));
            Date date2 = sdf.parse(sdf.format(cal.getTime()));
            cal.setTime(date1);
            int d = 0;
            int sum = 0;
            while(!date1.after(date2))
            {
                graph_date.add(new SimpleDateFormat("dd.MM.yyyy").format(date1));
                while(d < date.size() && date1.getTime() == date.elementAt(d))
                {
                    sum += numb.elementAt(d);
                    d++;
                }
                number.add(sum);
                cal.add(Calendar.DATE, 1);
                date1 = sdf.parse(sdf.format(cal.getTime()));
            }
            for (int i = 0; i < number.size(); i++)
                number.setElementAt(number.elementAt(i) + avRes.getNumber() - sum, i);
            String[] columnNames = {"Дата", "Кол-во, " + avRes.getMeasureName()};
            Object[][] data = new Object[number.size()][2];
            for (int i = 0; i < number.size(); i++)
            {
                data[i][0] = graph_date.elementAt(i);
                data[i][1] = Integer.toString(number.elementAt(i));
            }
            JTable jtable = new JTable(data, columnNames);
            MakeFileXLS mfXLS = new MakeFileXLS();
            mfXLS.makeFile(jtable, avRes.getResourceName());
        }
    }
%>
<%@include file = "layout1.jsp"%>
<script src="plugins/charts/Chart.js"></script> 
<br>
<div class="form-block center-block" style="width: 50%; min-height: 500px;">
    <center><h2 class="title"><%=avRes.getResourceName()%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="form-group col-sm-7">
            <p style="font-size: 15px;"> <b>Кол-во:</b> <%=avRes.getNumber()%> <%=avRes.getMeasureName()%></p>
            <%if (req.length > 0 && date.size() > 0){%><p style="font-size: 15px;"> <a href="/home/table.xls" download="table.xls"> Скачать таблицу </a></p><%}%>
        </div>
        <%if (req.length > 0 && date.size() > 0){%><canvas class="graph-line" id="myChart1"></canvas><%}%>
    </form>
    <%if (req.length > 0 && date.size() > 0){%>
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
<%@include file = "layout2.jsp"%>