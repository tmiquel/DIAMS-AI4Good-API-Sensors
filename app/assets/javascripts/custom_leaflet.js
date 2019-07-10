// OZONE MAP FROM ATMOSUD

var mapid_ozone_varjs = L.map('mapid').setView([46.227638, 2.213749], 6.2);

//fitBounds([[42.858, 4.855], [45.731, 7.759]]);


L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    transparent: true,    
    opacity: 0.7,
    accessToken: 'pk.eyJ1IjoidG1pcXVlbCIsImEiOiJjanU5d3AzenEyY2QxNDRucnF2c3pydW8wIn0.PQGiuirI2MraPTanoBJzRQ'
}).addTo(mapid_ozone_varjs);


//var marker = L.marker([43.300771, 5.382177]).addTo(mapid_ozone_varjs);
//marker.bindPopup("<b>PM10 :</b><br>valeur associé.<br><b>PM2_5 :</b><br>valeur associé.").openPopup();

var popup = L.popup();

function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(mapid_ozone_varjs);
}

mapid_ozone_varjs.on('click', onMapClick);

 realtime = L.realtime({
        url: 'https://wanderdrone.appspot.com/',
        crossOrigin: true,
        type: 'json'
    }, {
        interval: 3 * 1000
    }).addTo(mapid_ozone_varjs);

realtime.on('update', function() {
    mapid_ozone_varjs.fitBounds(realtime.getBounds(), {maxZoom: 3});
});

