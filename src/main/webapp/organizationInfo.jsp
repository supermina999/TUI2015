<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="controllers.OrganizationController"%>

<% int minPermission = 8;
    int tab = 0;
    String s = request.getParameter("id");
    Organization org = new Organization();
    Person[] persons = null;
    City[] city = null;
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<%} else {
        int i = Integer.parseInt(s);
        org = Organization.getOne(i);
        city = City.getAll(null);
        persons = OrganizationController.getPersons(i);
    }
%>
<%@include file = "layout1.jsp"%>
<script src="plugins/charts/Chart.js"></script>  
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить организацию?")) {
            return true;
        } else {
            return false;
        }
    }
</script>
<br>
<div class="form-block center-block" style="width: 50%; min-height: 900px;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeOrganizationInfo.jsp?id=<%=org.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteOrganization.jsp?id=<%=org.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title"><%=org.getName()%></h2></center>
    <hr>
    <form class="form-horizontal">
        <div class="col-lg-4 col-sm-4">
            <div class="box-style-1 gray-bg team-member">
                <img src="images/old_logo.png" alt="">
            </div>
        </div>
        <div class="form-group col-sm-7">
            <p style="font-size: 20px;"> <b>Адрес:</b> <%=org.getAddress()%> </p>
            <p style="font-size: 20px;"> <b>Вебсайт:</b> <%=org.getWebsite()%> </p>
            <p style="font-size: 20px;"> <b>Волонтеры:</b> <%=persons.length%></p> 

        </div>
        <div class="form-group"></div>
        <div class="gray-bg">
            <br>
            <div class="col-md-8">
                <input type="text" class="form-control searchInput" placeholder="ФИО" style="width: 105%;">
                <i class="fa fa-search form-control-feedback"></i>
            </div>
            <div class="col-md-4">
                <select class="form-control searchInput" style="width: 100%;">
                    <option>Выберите город</option>
                    <%for (int j = 0; j < city.length; j++) {%>
                    <option><%=city[j].getName()%></option>
                    <%}%>
                </select>
            </div>
            <br><br><br>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th style="width: 50%;">ФИО</th>
                    <th style="width: 25%;">Телефон</th>
                    <th style="width: 25%;">Email</th>
                </tr>
            </thead>
            <tbody id="searchTable">
                <%for (int j = 0; j < persons.length; j++) {%>
                <tr>
                    <td style="width: 50%;">
                        <a href="userInfo.jsp?id=<%=persons[j].getId()%>"><%=persons[j].getSurname() + " " + persons[j].getName() + " " + persons[j].getSecondName()%></a>
                    </td>

                    <td style="width: 25%;"><%=persons[j].getPhone()%></td>

                    <td style="width: 25%;"><%=persons[j].getEmail()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </form>
    <div style="width: 80%">
        <center>
            <h2 class="title">Кол-во пользователей</h2>
            <canvas class="graph-line" id="myChart"> </canvas>
        </center>>
    </div>
    <%
        Vector<String> graph_date = new Vector<String>();
        Vector<Integer> number = new Vector<Integer>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        int i = 0;
        int d = 0;
        Date date = persons[0].getDate();
        Date date_end = persons[persons.length - 1].getDate();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, -1);
        date = sdf.parse(sdf.format(cal.getTime()));
        while (!date.after(date_end)) {
            graph_date.add(new SimpleDateFormat("dd.MM.yyyy").format(date));
            String dr = sdf.format(persons[i].getDate());
            while (sdf.format(date).equals(dr) && i < persons.length) {
                i++;
                d++;
                if (i < persons.length) {
                    dr = sdf.format(persons[i].getDate());
                }
            }
            number.add(d);
            cal.add(Calendar.DATE, 1);
            date = sdf.parse(sdf.format(cal.getTime()));
        }
    %>
<script>
        var data1 = {
            labels: ["<%=graph_date.elementAt(0)%>"<%for (i = 1; i < graph_date.size(); i++) {%>, "<%=graph_date.elementAt(i)%>"<%}%>],
                    datasets: [
                    {
                            label: "My First dataset",
                            fillColor: "rgba(220,220,220,0.2)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(220,220,220,1)",
                            data: [<%=number.elementAt(0)%><%for (i = 1; i < number.size(); i++) {%>, <%=number.elementAt(i)%><%}%>]
                    }
                    ]
            };
        window.onload = function() 
        {
            var ctx = document.getElementById("myChart").getContext("2d");
            window.myNewChart = new Chart(ctx).Line(data1, {responsive: true});
        };
</script>
</div>
<script src="js/charts.js"></script>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>