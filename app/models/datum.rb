class Datum < ApplicationRecord
    validates_presence_of :device
    after_create -> {LastDatum.update_from_Arduino(self)}
    after_update -> {LastDatum.update_from_GPSLogger(self)}

    def self.get_last(device_name)
    	return Datum.where(device: device_name).last
    end

    def get_last_location
    	last_datum_with_loc = 
    		Datum.where(
    			"device = ? AND latitude IS NOT ? AND id < ?",
    			 self.device, nil, self.id).last
    	return last_datum_with_loc == nil ? [nil, nil] : 
    	last_datum_with_loc.latitude, last_datum_with_loc.longitude
    end



    def self.fill_null_locations
		Datum.where("(latitude IS ?) OR (longitude IS ?)", nil, nil).
		find_each do |datum|
  			datum.update(latitude: datum.get_last_location[0], 
  				longitude: datum.get_last_location[1])
		end
    end



end
