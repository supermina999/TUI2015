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
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 3) {%>
<%@include file = "wrongPermission.jsp"%>
<% } else {%>
<br>

<div class="form-block center-block" style="width: 50%; min-height: 1000px;">
  <center><h2 class="title">Изменить опасность дороги</h2></center>
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

  function addRoutes() {
    <%
      if (Map.nodes.size() == 0) Map.load();
      for (int i = 0; i < Map.graph.size(); i++) {
        maps.Node node1 = Map.nodes.get(i);
        for (int j = 0; j < Map.graph.get(i).size(); j++) {
          if (Map.graph.get(i).get(j).safety == 0) continue;
          maps.Node node2 = Map.nodes.get(Map.graph.get(i).get(j).node);
    %>
    myMap.geoObjects.add(new ymaps.Polyline([[<%= node1.x%>, <%=node1.y%>], [<%=node2.x%>, <%=node2.y%>]], {}, {
      strockeWidth: 6,
      strokeColor: '#0000FF'
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