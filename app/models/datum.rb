class Datum < ApplicationRecord
    validates_presence_of :devise
    after_create -> {LastDatum.update_from_Arduino(self)}
    after_update -> {LastDatum.update_from_GPSLogger(self)}

    def self.get_last(devise_name)
    	return Datum.where(devise: devise_name).last
    end

end
