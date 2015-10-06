<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.*"%>
<%@page import="java.util.Vector" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<% int minPermission = 8; 
   int tab = 6; %>
<%@include file = "layout1.jsp"%>
<script src="plugins/charts/Chart.js"></script>  
<%
    Resource[] resource = Resource.getAll(null);
    Person[] person = Person.getAll(null);
    AvailableResource[] avr = AvailableResource.getAll(null);
    Losing[] los = Losing.getAll(null);
    Receiving[] rec = Receiving.getAll(null);
%>

<center><br><h1>Отчёты</h1><br>

<div style="min-height: 700px; width: 80%;">
<div class="vertical">
    <ul class="nav nav-tabs" role="tablist">
        <li class><a href="#vtab0" role="tab" data-toggle="tab" aria-expanded="true">Пользователи</a> </li>
        <li class><a id="tabRes" style="cursor: pointer;"> Ресурсы</a> 
        <% for (int i = 0; i < resource.length; i++) { %>
        <li href="#vtab<%=i + 2%>"><a id="res<%=i%>" style="cursor: pointer;" class="hidden"><%=resource[i].getName()%></a></li>
        <% } %>
    </ul>
    <div class="tab-content" style="width: 100%;">
        <div class="tab-pane fade in active" id="vtab0">
            <canvas id="myChart"></canvas>
        </div>
        <div class="tab-pane fade" id="vtab1">
            
        </div>
    </div>
</div>
</div> </center>
    <%
        Vector<String> graph_date = new Vector<String>();
        Vector<Integer> number = new Vector<Integer>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int i = 0;
        int d = 0;
        Date date_begin = person[0].getDate();
        Date date_end = person[person.length - 1].getDate();
        Date date = date_begin;
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        while (!date.after(date_end))
        {
            graph_date.add(new SimpleDateFormat("dd.MM.yyyy").format(date));
            String dr = sdf.format(person[i].getDate());
            while(sdf.format(date).equals(dr) && i < person.length)
            {
                i++;
                d++;
                if (i < person.length)
                    dr = sdf.format(person[i].getDate());
            }
            number.add(d);
            d = 0;
            cal.add(Calendar.DATE, 1);
            date = sdf.parse(sdf.format(cal.getTime()));
        }


    %>
<script>
    var data = {
        labels: ["<%=graph_date.elementAt(0)%>"<%for (i = 1; i < graph_date.size(); i++){%>, "<%=graph_date.elementAt(i)%>"<%}%>],
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [<%=number.elementAt(0)%><%for (i = 1; i < number.size(); i++){%>, <%=number.elementAt(i)%><%}%>]
            }
        ]
    };
    window.onload = function() {
        var ctx = document.getElementById("myChart").getContext("2d");
        window.myNewChart = new Chart(ctx).Line(data, {responsive: true});
    };
</script>
</center>
<script src="js/charts.js"></script>
<%@include file = "layout2.jsp"%>
