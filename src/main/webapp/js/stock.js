ymaps.ready(init);
var myMap, myCollection, myPlacemark;
function init() {
    myCollection = new ymaps.GeoObjectCollection();
    myMap = new ymaps.Map("map", {
        center: [48.463629, 31.685961],
        zoom: 15
    });
    var region = $('#region option:selected').text();
    var city = getCity(region);
    addPlacemark(city);
    setCenter(city);
}

function setCenter(address) {
    var myGeocoder = ymaps.geocode(
            address, {
                results: 1
            }
    );
    myGeocoder.then(
            function (res) {
                if (res.geoObjects.getLength()) {
                    var point = res.geoObjects.get(0);
                    myMap.panTo(point.geometry.getCoordinates());
                }
            }
    );
}

function getCity(region) {
    if (region === "Винницкая область") return "Винница";
    if (region === "Волынская область") return "Луцк";
    if (region === "Днепропетровская область") return "Днепропетровск";
    if (region === "Донецкая область") return "Донецк";
    if (region === "Житомирская область") return "Житомир";
    if (region === "Закарпатская область") return "Ужгород";
    if (region === "Запорожская область") return "Запорожье";
    if (region === "Ивано-Франковская область") return "Ивано-Франковск";
    if (region === "Киевская область") return "Киев";
    if (region === "Кировоградская область") return "Кировоград";
    if (region === "Луганская область") return "Луганск";
    if (region === "Львовская область") return "Львов";
    if (region === "Николаевская область") return "Николаев";
    if (region === "Одесская область") return "Одесса";
    if (region === "Полтавская область") return "Полтава";
    if (region === "Ровенская область") return "Ровно";
    if (region === "Сумская область") return "Сумы";
    if (region === "Тернопольская область") return "Тернополь";
    if (region === "Харьковская область") return "Харьков";
    if (region === "Херсонская область") return "Херсон";
    if (region === "Хмельницкая область") return "Хмельницк";
    if (region === "Черкасская область") return "Черкасы";
    if (region === "Черниговская область") return "Чернигов";
    return "Черновцы";
}

function addCustomPlacemark() {
    var myCoords = myMap.getCenter();
    var myGeocoder = ymaps.geocode(myCoords);
    myGeocoder.then(
            function (res) {
                if (res.geoObjects.getLength()) {
                    var address = res.geoObjects.get(0);
                    $('#address').val(address.properties.get('name'));
                }
            }
    );
    myPlacemark = new ymaps.GeoObject({
        geometry: {
            type: "Point",
            coordinates: myMap.getCenter()
        }
    }, {
        preset: 'islands#redStretchyIcon',
        draggable: true
    });
    $('#lat').val(myMap.getCenter()[0]);
    $('#lon').val(myMap.getCenter()[1]);
    myCollection.removeAll();
    myCollection.add(myPlacemark);
    myMap.geoObjects.add(myCollection);
    myCollection.events.add("dragend", function (e) {
        coords = e.get('target').geometry.getCoordinates();
        $('#lat').val(coords[0]);
        $('#lon').val(coords[1]);
        var geocoder = ymaps.geocode(coords);
        geocoder.then(
                function (res) {
                    if (res.geoObjects.getLength()) {
                        var address = res.geoObjects.get(0);
                        $('#address').val(address.properties.get('name'));
                    }
                }
        );
    });
}

function addPlacemark(address) {
    var myGeocoder = ymaps.geocode(
            address, {
                results: 1
            }
    );
    myMap.setZoom(17);
    myGeocoder.then(
            function (res) {
                if (res.geoObjects.getLength()) {
                    var point = res.geoObjects.get(0);
                    $('#lat').val(point.geometry.getCoordinates()[0]);
                    $('#lon').val(point.geometry.getCoordinates()[1]);
                    var placemark = new ymaps.Placemark(point.geometry.getCoordinates());
                    myCollection.removeAll();
                    myCollection.add(placemark);
                    myMap.geoObjects.add(myCollection);
                }
            }
    );
}

function update() {
    if ($('#address').val() != "") {
        var address = $('#region option:selected').text() + ", " + $('#address').val();
        addPlacemark(address);
        setCenter(address);
    } else {
        var region = $('#region option:selected').text();
        var city = getCity(region);
        addPlacemark(city);
        setCenter(city);
    }
}

$('#region').change(function () {
    if ($('#type option:selected').text() === "На карте") {
        $('#type option[id="1"]').prop('selected', true);
        myCollection.removeAll();
        $('#address').val("");
        $('#lat').val("");
        $('#lon').val("");
    }
    update();
});

$('#address').keyup(function () {
    update();
});

$('#type').change(function () {
    if ($('#type option:selected').text() === "По адресу") {
        myCollection.removeAll();
        $('#address').val("");
        $('#lat').val("");
        $('#lon').val("");
        update();
    } else {
        addCustomPlacemark();
    }
});