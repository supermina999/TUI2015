<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.*"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<% int minPermission = 8;
    int tab = 6;
   %>
<%@include file = "layout1.jsp"%>
<script src="plugins/charts/Chart.js"></script>  
<%
    Person[] person = Person.getAll(null);
    Organization[] organization = Organization.getAll(null);
    Stock[] stock = Stock.getAll(null);
    Station[] station = Station.getAll(null);
%>

<center><br><h1>Отчёты</h1><br>


    <div style="min-height: 700px; width: 80%;">
        <div class="vertical">
            <ul class="nav nav-tabs" role="tablist">
                <li class><a href="#vtab1" role="tab" data-toggle="tab" aria-expanded="false">Пользователи</a></li>
                <li class><a href="#vtab2" role="tab" data-toggle="tab" aria-expanded="false">Организации</a></li>
                <li class><a href="#vtab3" role="tab" data-toggle="tab" aria-expanded="false">Склады</a></li>
                <li class><a href="#vtab4" role="tab" data-toggle="tab" aria-expanded="false">Пункты выдачи</a></li>

            </ul>
            <div class="tab-content" style="width: 80%;">
                <div class="tab-pane fade active in" id="vtab1">
                    <canvas class="graph-line" id="myChart1"></canvas>
                </div>
                <div class="tab-pane fade active in" id="vtab2">
                    <canvas class="graph-line" id="myChart2"></canvas>
                </div>
                <div class="tab-pane fade active in" id="vtab3">
                    <canvas class="graph-line" id="myChart3"></canvas>
                </div>
                <div class="tab-pane fade active in" id="vtab4">
                    <canvas class="graph-line" id="myChart4"></canvas>
                </div>
            </div>
        </div>
    </div></center>
    <%
        Vector<String> graph_date1 = new Vector<String>();
        Vector<Integer> number1 = new Vector<Integer>();
        Vector<String> graph_date2 = new Vector<String>();
        Vector<Integer> number2 = new Vector<Integer>();
        Vector<String> graph_date3 = new Vector<String>();
        Vector<Integer> number3 = new Vector<Integer>();
        Vector<String> graph_date4 = new Vector<String>();
        Vector<Integer> number4 = new Vector<Integer>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int i = 0;
        int d = 0;
        Date date = person[0].getDate();
        Date date_end = person[person.length - 1].getDate();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        date = sdf.parse(sdf.format(cal.getTime()));
        while (!date.after(date_end)) {
            graph_date1.add(new SimpleDateFormat("dd.MM.yyyy").format(date));
            String dr = sdf.format(person[i].getDate());
            while (sdf.format(date).equals(dr) && i < person.length) {
                i++;
                d++;
                if (i < person.length) {
                    dr = sdf.format(person[i].getDate());
                }
            }
            number1.add(d);
            cal.add(Calendar.DATE, 1);
            date = sdf.parse(sdf.format(cal.getTime()));
        }
        date = organization[0].getDate();
        date_end = organization[organization.length - 1].getDate();
        i = 0;
        d = 0;
        cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        date = sdf.parse(sdf.format(cal.getTime()));
        while (!date.after(date_end)) {
            graph_date2.add(new SimpleDateFormat("dd.MM.yyyy").format(date));
            String dr = sdf.format(organization[i].getDate());
            while (sdf.format(date).equals(dr) && i < organization.length) {
                i++;
                d++;
                if (i < organization.length) {
                    dr = sdf.format(organization[i].getDate());
                }
            }
            number2.add(d);
            cal.add(Calendar.DATE, 1);
            date = sdf.parse(sdf.format(cal.getTime()));
        }
        date = stock[0].getDate();
        date_end = stock[stock.length - 1].getDate();
        i = 0;
        d = 0;
        cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        date = sdf.parse(sdf.format(cal.getTime()));
        while (!date.after(date_end)) {
            graph_date3.add(new SimpleDateFormat("dd.MM.yyyy").format(date));
            String dr = sdf.format(stock[i].getDate());
            while (sdf.format(date).equals(dr) && i < stock.length) {
                i++;
                d++;
                if (i < stock.length) {
                    dr = sdf.format(stock[i].getDate());
                }
            }
            number3.add(d);
            cal.add(Calendar.DATE, 1);
            date = sdf.parse(sdf.format(cal.getTime()));
        }
        date = station[0].getDate();
        date_end = station[station.length - 1].getDate();
        i = 0;
        d = 0;
        cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        date = sdf.parse(sdf.format(cal.getTime()));
        while (!date.after(date_end)) {
            graph_date4.add(new SimpleDateFormat("dd.MM.yyyy").format(date));
            String dr = sdf.format(station[i].getDate());
            while (sdf.format(date).equals(dr) && i < station.length) {
                i++;
                d++;
                if (i < station.length) {
                    dr = sdf.format(station[i].getDate());
                }
            }
            number4.add(d);
            cal.add(Calendar.DATE, 1);
            date = sdf.parse(sdf.format(cal.getTime()));
        }
    %>
<script>
            var data1 = {
            labels: ["<%=graph_date1.elementAt(0)%>"<%for (i = 1; i < graph_date1.size(); i++) {%>, "<%=graph_date1.elementAt(i)%>"<%}%>],
                    datasets: [
                    {
                    label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [<%=number1.elementAt(0)%><%for (i = 1; i < number1.size(); i++) {%>, <%=number1.elementAt(i)%><%}%>]
                    }
                    ]
            };
            var data2 = {
            labels: ["<%=graph_date2.elementAt(0)%>"<%for (i = 1; i < graph_date2.size(); i++) {%>, "<%=graph_date2.elementAt(i)%>"<%}%>],
                    datasets: [
                    {
                    label: "Организации",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [<%=number2.elementAt(0)%><%for (i = 1; i < number2.size(); i++) {%>, <%=number2.elementAt(i)%><%}%>]
                    }
                    ]
            };
            var data3 = {
            labels: ["<%=graph_date3.elementAt(0)%>"<%for (i = 1; i < graph_date3.size(); i++) {%>, "<%=graph_date3.elementAt(i)%>"<%}%>],
                    datasets: [
                    {
                    label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [<%=number3.elementAt(0)%><%for (i = 1; i < number3.size(); i++) {%>, <%=number3.elementAt(i)%><%}%>]
                    }
                    ]
            };
            var data4 = {
            labels: ["<%=graph_date4.elementAt(0)%>"<%for (i = 1; i < graph_date4.size(); i++) {%>, "<%=graph_date4.elementAt(i)%>"<%}%>],
                    datasets: [
                    {
                    label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [<%=number4.elementAt(0)%><%for (i = 1; i < number4.size(); i++) {%>, <%=number4.elementAt(i)%><%}%>]
                    }
                    ]
            };
            window.onload = function() {
            var ctx = document.getElementById("myChart1").getContext("2d");
                    window.myNewChart = new Chart(ctx).Line(data1, {responsive: true});
                    var ctx = document.getElementById("myChart2").getContext("2d");
                    window.myNewChart = new Chart(ctx).Line(data2, {responsive: true});
                    var ctx = document.getElementById("myChart3").getContext("2d");
                    window.myNewChart = new Chart(ctx).Line(data3, {responsive: true});
                    var ctx = document.getElementById("myChart4").getContext("2d");
                    window.myNewChart = new Chart(ctx).Line(data4, {responsive: true});
            };</script>
<script src="js/charts.js"></script>
<%@include file = "layout2.jsp"%>
