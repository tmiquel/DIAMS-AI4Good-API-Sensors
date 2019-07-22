require 'rgeo/geo_json'


class GeoJsonParser
	
	def get_long_lat_array(geojson_string)
		longitude , latitude = JSON.parse(geojson_string)["locations"][0]["geometry"]["coordinates"]
		return longitude.to_s, latitude.to_s
	end

	def perform
		strOverland = '{"locations": [
	    {
	      "type": "Feature",
	      "geometry": {
	        "type": "Point",
	        "coordinates": [
	          -122.030581, 
	          37.331800
	        ]
	      },
	      "properties": {
	        "timestamp": "2015-10-01T08:00:00-0700",
	        "altitude": 0,
	        "speed": 4,
	        "horizontal_accuracy": 30,
	        "vertical_accuracy": -1,
	        "motion": ["driving","stationary"],
	        "pauses": false,
	        "activity": "other_navigation",
	        "desired_accuracy": 100,
	        "deferred": 1000,
	        "significant_change": "disabled",
	        "locations_in_payload": 1,
	        "battery_state": "charging",
	        "battery_level": 0.89,
	        "device_id": "",
	        "wifi": ""
	      }
	    }
	  ]
	}'
		
		long, lat = self.get_long_lat_array(strOverland)
		puts long
		puts long.class
		puts lat
		puts lat.class
		puts "rrr"*10


	end


end

GeoJsonParser.new.perform

