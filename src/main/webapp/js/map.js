ymaps.ready(init);
var myMap;

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
            $('#lat').val(point.geometry.getCoordinates()[0].toString());
            $('#lon').val(point.geometry.getCoordinates()[1].toString());
            myMap.geoObjects.add(point);
            myMap.panTo(point.geometry.getCoordinates());
           }
        }
    );
}

function addRoute (address1, address2) {
    var myRouter = ymaps.route([address1, address2], { mapStateAutoApply: true});
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
            $('#lat').val(point.geometry.getCoordinates()[0].toString());
            $('#lon').val(point.geometry.getCoordinates()[1].toString());
           }
        }
    );
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