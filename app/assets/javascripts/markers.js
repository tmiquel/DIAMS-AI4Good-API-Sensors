// Markers initialization, to free them when got a update from one
var markers = {};
// Initialization with real values for the first time
updatePointer(mapid_ozone_varjs);
// Timer to update
setInterval(updatePointer, 10000, mapid_ozone_varjs);

// Takes the map id (mapid_ozone_varjs)
function updatePointer(mapId) {
  $.get("/data", function (datas) {
    console.log(datas);
    for (var i = 0; i < datas.length; i++) {
      var data = datas[i]
      if(data["mixed_feeling"]){
        var marker = L.marker(L.latLng(data["latitude"], data["longitude"]), {icon: orangeIcon})
      } else if (data["negative_feeling"]) {
        var marker = L.marker(L.latLng(data["latitude"], data["longitude"]), {icon: redIcon})
      } else {
        var marker = L.marker(L.latLng(data["latitude"], data["longitude"]), {icon: greenIcon})
      }
      if(markers[data["devise"]]){
        markers[data["devise"]].removeFrom(mapId)
        delete markers[data["devise"]]
      }
      marker.bindPopup(`<b>PM10:</b><br>${data['PM10']}<br><b>PM2_5 :</b><br>${data['PM2_5']}`);
      markers[data["devise"]] = marker.addTo(mapId)
    }
    // var marker = L.marker([43.300771, 5.382177], {icon: greenIcon}).addTo(mapid_ozone_varjs);
  });
}
