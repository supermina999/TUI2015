<%@ page import="java.util.ArrayList" %>
<%@ page import="maps.Map" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<%
  if (!isLogin) {%>
<script>
  window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 3 && user.user.getPermissionId() != 4) {%>
<%@include file = "wrongPermission.jsp"%>
<% } else {%>
<br>

<div class="form-block center-block" style="width: 50%; min-height: 1000px;">
    <div style="margin-left: 37%;">
        <p><a href="changeSafety.jsp" class="btn btn-default"><i class="fa fa-plus"></i> Изменить опасность дороги</a></p>
    </div>
  <center><h2 class="title">Опасность дорог</h2></center>
  <hr>
  <div class="form-horizontal">
    <br>
    <div id="map" style="width: 100%; height: 300px"></div><br>
  </div>
</div>
<br>

<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<script>
  ymaps.ready(init);
  var myMap, myCollection;

  var colors = ['', '#00FF00', '#37C800', '#7D8200', '#AF5000', '#FF0000'];

  function addRoutes() {
    <%
      if (Map.nodes.size() == 0) Map.load();
      for (int i = 0; i < Map.graph.size(); i++) {
        maps.Node node1 = Map.nodes.get(i);
        for (int j = 0; j < Map.graph.get(i).size(); j++) {
          int safety = Map.graph.get(i).get(j).safety;
          if (safety == 0) continue;
          maps.Node node2 = Map.nodes.get(Map.graph.get(i).get(j).node);
    %>
    myMap.geoObjects.add(new ymaps.Polyline([[<%=node1.x%>, <%=node1.y%>], [<%=node2.x%>, <%=node2.y%>]], {}, {
      strokeWidth: 4,
      strokeColor: colors[<%=safety%>]
    }));
    <%}}%>
  }

  function init() {
    myCollection = new ymaps.GeoObjectCollection();
    myMap = new ymaps.Map("map", {
      center: [48.463629, 31.685961],
      zoom: 6
    });
    addRoutes();
  }
</script>

<% } %>
<%@include file = "layout2.jsp"%>