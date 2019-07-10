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
        url: 'http://localhost:3000/last_data/1',
        crossOrigin: true,
        type: 'json'
    }, {
        interval: 3 * 1000
    }).addTo(mapid_ozone_varjs);

realtime.on('update', function() {
    mapid_ozone_varjs.fitBounds(realtime.getBounds(), {maxZoom: 3});
});

function getCustomData(success, error) { 
    let url = "http://localhost:3000/last_data/1"; //url of service 
    var xhr = new XMLHttpRequest(); 
    xhr.open('GET', url); 
    xhr.onload = function() { 
     if (xhr.status === 200) { 
      var res = convertToGeoJSON(xhr.responseText); 
      success(res); 
     } else { 
      var e = new Error("HTTP Rquest") 
       error(e, xhr.status); 
     } 
    }; 
    xhr.send(); 
} 

function convertToGeoJSON(input){ 
    var fs={"type": "FeatureCollection", "features": []}; 
    for(var i=0;i<input.length;i++){ 
     var ele=input[i]; 
     var feature={ 
       "type": "Feature", 
       "geometry": { 
       "type": "Point", 
       "coordinates":[ele['longitude'],ele['latitude']] 
       }}; 
     feature.properties=ele; 

     //add this feature to the features array 
     fs.features.push(feature) 

    } 
    //return the GeoJSON FeatureCollection 
    return fs; 
} 