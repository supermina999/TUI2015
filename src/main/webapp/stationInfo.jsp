<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8;
    int tab = 5;
    String s = request.getParameter("id");
    Station station = new Station();
    DBEntry[] params = {
        new DBEntry("base_id", EntryType.Int, Integer.parseInt(s))
    };
    AvailableResource[] availableRes = AvailableResource.getAll(params);
    Resource[] resource = Resource.getAll(null);
    if (s == null) {%>
<script>
    window.location.href = "index.jsp";
</script>
<% } else {
        station = Station.getOne(Integer.parseInt(s));
    }
%>
<%@include file = "layout1.jsp"%>
<script>
    function confirmDelete() {
        if (confirm("Вы уверены, что хотите удалить пункт выдачи?")) {
            return true;
        } else {
            return false;
        }
    }
</script>

<br>
<div class="form-block center-block" style="width: 50%; min-height: 500px;">
    <div style="margin-left: 90%;">
        <p style="font-size: 25px;"><a href="changeStationInfo.jsp?id=<%=station.getId()%>"><i class="fa fa-edit"></i></a>
            <a href="deleteStation.jsp?id=<%=station.getId()%>" onclick="return confirmDelete();"><i class="fa fa-close"></i></a></p>
    </div>
    <center><h2 class="title">Пункт выдачи № <%=Integer.parseInt(s)%></h2></center>
    <hr>
    <form class="form-horizontal">

        <div class="form-group col-sm-7">
            <p style="font-size: 15px;"> <b>Организация:</b> <a href="organizationInfo.jsp?id=<%=station.getOrganizationId()%>"><%=station.getOrganizationName()%></a> </p>
            <p style="font-size: 15px;"> <b>Город:</b> <%=station.getLocation().getCityName()%>, <%=station.getLocation().getCountryName()%> </p>
            <p style="font-size: 15px;"> <b>Адрес:</b> <%=station.getLocation().getAddress()%> </p>

        </div>
        <div class="form-group"></div>
        <a href="baseResources.jsp?id=<%=station.getId() + "&is_stock=false&is_needed=false"%>" 
           class="btn btn-default btn-lg" style="width: 45%;">Ресурсы в наличии</a>
        <a href="baseResources.jsp?id=<%=station.getId() + "&is_stock=false&is_needed=true"%>" 
           class="btn btn-default btn-lg" style="width: 45%;">Необходимые ресурсы</a>
    </form>
</div>
<script src="js/search.js"></script>
<%@include file = "layout2.jsp"%>