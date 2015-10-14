ymaps.ready(init);
var myMap, myCollection, myPlacemark;

function init() {
    myCollection = new ymaps.GeoObjectCollection();
    myMap = new ymaps.Map("map", {
        center: [48.463629, 31.685961],
        zoom: 15
    });
    setCenter($("#city option:selected").text());
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
    var address = $('#city option:selected').text() + ", " + $('#address').val();
    addPlacemark(address);
    setCenter(address);
}

$('#city').change(function () {
    if ($('#type option:selected').text() === "НА КАРТЕ") {
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
    if ($('#type option:selected').text() === "ПО АДРЕСУ") {
        myCollection.removeAll();
        $('#address').val("");
        $('#lat').val("");
        $('#lon').val("");
    } else {
        addCustomPlacemark();
    }
});