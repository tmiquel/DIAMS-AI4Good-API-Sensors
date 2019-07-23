class Datum < ApplicationRecord
    validates_presence_of :device
    after_create -> {LastDatum.update_from_Arduino(self)}
    after_update -> {LastDatum.update_from_GPSLogger(self)}

    def self.get_last(device_name)
    	return Datum.where(device: device_name).last
    end

end
