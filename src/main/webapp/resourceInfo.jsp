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
        new DBEntry("resource_id", EntryType.Int, id)
    };
    AvailableResource[] availableRes = AvailableResource.getAll(params);
    Request[] req = Request.getAll(params);
    Vector<Integer> req_id = new Vector<Integer>();
    Vector<Long> date = new Vector<Long>();
    Vector<Integer> numb = new Vector<Integer>();
    for (int i = 0; i < req.length; i++)
        req_id.add(req[i].getId());
    DBEntry[] params2 = {
        new DBEntry("status_id", EntryType.Int, 1)
    };
    Transportation[] trans = Transportation.getAll(params2);
    for (int i = 0; i < trans.length; i++)
    {
        if ((stock_id != -1 && trans[i].getStockId() == stock_id) || stock_id == -1)
        for (int j = 0; j < req_id.size(); j++)
            if (req_id.elementAt(j) == trans[i].getRequestId())
            {
                if (trans[i].getRequestTypeId() == 1)
                {
                    numb.add(trans[i].getResourceNumber() * -1);
                    date.add(trans[i].getTimeStart().getTime());
                }
                else
                {
                    numb.add(trans[i].getResourceNumber());
                    date.add(trans[i].getTimeFinish().getTime());               
                }
            }
    }
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
    Vector<String> graph_date = new Vector<String>();
    Vector<Integer> number = new Vector<Integer>();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
    HSSFWorkbook table = new HSSFWorkbook();
    HSSFSheet fSheet = table.createSheet(avRes.getResourceName());
    HSSFFont sheetTitleFont = table.createFont();
    
    File file = new File("table.xls");
    HSSFCellStyle cellStyle = table.createCellStyle();
    sheetTitleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
    TableModel model = jtable.getModel();
    TableColumnModel tcm = jtable.getColumnModel();
    HSSFRow fRow = fSheet.createRow(0);
    for(int j = 0; j < tcm.getColumnCount(); j++) 
    {
        HSSFCell cell = fRow.createCell(j);
        cell.setCellValue(columnNames[j]);           
    }
    for (int i = 0; i < model.getRowCount(); i++) 
    {
        fRow = fSheet.createRow(i + 1);
        for (int j = 0; j < model.getColumnCount(); j++) 
        {
            HSSFCell cell = fRow.createCell(j);
            cell.setCellValue(model.getValueAt(i, j).toString());
            cell.setCellStyle(cellStyle);
        }
    }
    FileOutputStream fileOutputStream;
    fileOutputStream = new FileOutputStream(file);
    BufferedOutputStream bos = new BufferedOutputStream(fileOutputStream);
    table.write(bos);
    bos.close();
    fileOutputStream.close();
%>
<%@include file = "layout1.jsp"%>
<script src="plugins/charts/Chart.js"></script> 
<br>
<div class="form-block center-block" style="width: 50%; min-height: 500px;">
    <center><h2 class="title"><%=avRes.getResourceName()%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="form-group col-sm-7">
            <p style="font-size: 15px;"> <b>Кол-во:</b> <%=avRes.getNumber()%></p>
            <%if (stock_id == -1) {%><p style="font-size: 15px;"> <b>Склады:</b> <a href="stockInfo.jsp?id=<%=availableRes[0].getStockId()%>">№<%=availableRes[0].getStockId()%></a> <%for (int i = 1; i < availableRes.length; i++) {%>, <a href="stockInfo.jsp?id=<%=availableRes[i].getStockId()%>">№<%=availableRes[i].getStockId()%></a> <%}%></p><%}%>
            <p style="font-size: 15px;"> <a href="table.xls" download="table.xls"> Скачать таблицу </a></p>
        </div>
        <canvas class="graph-line" id="myChart1"></canvas>
    </form>
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
</div>
<%@include file = "layout2.jsp"%>