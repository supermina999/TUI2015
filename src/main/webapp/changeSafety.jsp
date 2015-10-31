<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  int tab = -1;
%>
<%@include file = "layout1.jsp"%>
<%
  if (!isLogin) {%>
<script>
  window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 2 && user.user.getPermissionId() != 3 && user.user.getPermissionId() != 5) {%>
<%@include file = "wrongPermission.jsp"%>
<% } else { %>
<br>

<div class="form-block center-block" style="width: 50%; min-height: 700px;">
  <center><h2 class="title">Изменить безопасность дороги</h2></center>
  <hr>
  <div class="form-horizontal">
    <div class="form-group has-feedback">
      <label class="col-sm-3 control-label">Безопасность</label>
      <div class="col-sm-8">
        <select class="form-control" name="safety" id="safety" style="width: 100%; padding-right: 0">
          <option selected value="-1">Выберите Безопасность</option>
          <option value="0">Безопасно</option>
          <option value="1">Опасно</option>
          <option value="2">Очень опасно</option>
          <option value="3">Смертельно опасно</option>
        </select>
      </div>
    </div>
    <br>
    <div id="map" style="width: 100%; height: 300px"></div><br>
    <div class="form-group">
      <div class="col-sm-offset-3 col-sm-8">
        <button class="btn btn-group btn-default btn-block" onclick="clicked();">Готово</button>
      </div>
    </div>
  </div>
</div>
<br>

<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>
<script>
  ymaps.ready(init);
  var myMap, myCollection, myRoute;

  function addPlacemarks() {
    var myCoords = myMap.getCenter();

    myRoute = ymaps.route([myCoords, myCoords]).then(
      function (route) {
        myMap.geoObjects.add(route);
        route.editor.start({
          addWayPoints: false
        });
      },
      function (error) {
        alert('Возникла ошибка: ' + error.message);
      }
    );
  }

  function init() {
    myCollection = new ymaps.GeoObjectCollection();
    myMap = new ymaps.Map("map", {
      center: [48.463629, 31.685961],
      zoom: 6
    });
    addPlacemarks();
  }

  function clicked() {
    var safety = document.getElementById("safety").value;
    if (safety == -1) return;
    var startCords = myMap.geoObjects.get(0).requestPoints[0];
    var finishCoords = myMap.geoObjects.get(0).requestPoints[1];
    window.location.href="/updateSafety.jsp?x1=" + startCords[0] + "&y1=" + startCords[1] +
      "&x2=" + finishCoords[0] + "&y2=" + finishCoords[1] + "&safety=" + safety;
  }
</script>

<% } %>
<%@include file = "layout2.jsp"%>