<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 6; %>
<%@include file = "layout1.jsp"%>
<script src="plugins/charts/Chart.js"></script>  
<center>
        <br><h1>Отчёты</h1><br>
<div style="width: 50%;">
    <div>
        <canvas id="myChart" width="450" height="600"></canvas>
    </div>
</div>
<script>
    var data = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19, 86, 27, 90]
            }
        ]
    };
    window.onload = function() {
        var ctx = document.getElementById("myChart").getContext("2d");
        window.myNewChart = new Chart(ctx).Line(data, {responsive: true});
    };
</script>
</center>
<%@include file = "layout2.jsp"%>
