ymaps.ready(init);
var myMap, start, finish;

function init() { 
    myMap = new ymaps.Map("map", {
        center: [50.034581, 36.224968],
        zoom: 15
    }); 
}

function addPlacemark (address) {
    var myGeocoder = ymaps.geocode(
        address, {
            results: 1
        }
    );
    myGeocoder.then(
        function (res) {
           if (res.geoObjects.getLength()) {
            var point = res.geoObjects.get(0);
            addToTable(address, point.geometry.getCoordinates()[0].toString(), point.geometry.getCoordinates()[1].toString());
            myMap.geoObjects.add(point);
            myMap.panTo(point.geometry.getCoordinates());
           }
        }
    );
}

function addRoute (address1, address2) {
    var startGeocoder = ymaps.geocode(
        address1, {
            results: 1
        }
    );
    var finishGeocoder = ymaps.geocode(
        address2, {
            results: 1
        }
    );
    startGeocoder.then(
        function (res) {
           if (res.geoObjects.getLength()) {
            var point = res.geoObjects.get(0);
            addToTable(address1, point.geometry.getCoordinates()[0].toString(), point.geometry.getCoordinates()[1].toString());
           }
        }
    );
    finishGeocoder.then(
        function (res) {
           if (res.geoObjects.getLength()) {
            var point = res.geoObjects.get(0);
            addToTable(address2, point.geometry.getCoordinates()[0].toString(), point.geometry.getCoordinates()[1].toString());
           }
        }
    );
    var myRouter = ymaps.route([address1, address2], { 
        mapStateAutoApply: true
    });
    myRouter.then(function(route) {
        myMap.geoObjects.add(route);
    });
}

function getCoords (address) {
    var myGeocoder = ymaps.geocode(
        address, {
            results: 1
        }
    );
    myGeocoder.then(
        function (res) {
           if (res.geoObjects.getLength()) {
            var point = res.geoObjects.get(0);
            addToTable(address, point.geometry.getCoordinates()[0].toString(), point.geometry.getCoordinates()[1].toString());
           }
        }
    );
}

function addCustomPlacemarks () {
    start = new ymaps.GeoObject({
        geometry: {
            type: "Point",
            coordinates: [50.034581, 36.229968]
        },
        properties: {
            iconContent: 'Старт'
        }
    }, {
        preset: 'islands#redStretchyIcon',
        draggable: true
    });
    finish = new ymaps.GeoObject({
        geometry: {
            type: "Point",
            coordinates: [50.034581, 36.220968]
        },
        properties: {
            iconContent: 'Финиш'
        }
    }, {
        preset: 'islands#greenStretchyIcon',
        draggable: true
    });
    myMap.geoObjects.add(start);
    myMap.geoObjects.add(finish);
    $('#button4').addClass("hidden");
    $('#button5').removeClass("hidden");
}

function addCustomRoute () {
    var myRouter = ymaps.route([start.geometry.getCoordinates(), finish.geometry.getCoordinates()], { 
        mapStateAutoApply: true
    });
    myRouter.then(function(route) {
        myMap.geoObjects.add(route);
    });
}

function addToTable (address, x, y) {
    $('#table > tbody:last').append('<tr><th>' + address + '</th><th>' + x + '</th><th>' + y +'</th></tr>');
}

$("#button1").click(function() {
    addPlacemark($('#address1').val());
});

$("#button2").click(function() {
    addRoute($('#address2').val(),$('#address3').val());
});

$("#button3").click(function() {
    getCoords($('#address4').val());
});

$("#button4").click(function() {
    addCustomPlacemarks();
});

$("#button5").click(function() {
    addCustomRoute();
});