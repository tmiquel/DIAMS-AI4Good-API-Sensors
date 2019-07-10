// Markers initialization, to free them when got a update from one
var markers = {};
// Initialization with real values for the first time
updatePointer(sensors_map);
// Timer to update
setInterval(updatePointer, 10000, sensors_map);

// Takes the map id (sensors_map)
function updatePointer(mapId) {
  $.get("/last_data", function (datas) {
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
    // var marker = L.marker([43.300771, 5.382177], {icon: greenIcon}).addTo(sensors_map);
  });
}
