class LastDatum < ApplicationRecord
	def self.update_from_Arduino(datum)
		lastdatum_from_datum_new_item_array = LastDatum.where(devise: datum.devise)
		if lastdatum_from_datum_new_item_array.size == 0
			LastDatum.create(
				devise: datum.devise, 
				PM2_5: datum.PM2_5, 
				PM10: datum.PM10,
				positive_feeling: datum.positive_feeling,
				mixed_feeling: datum.mixed_feeling, 
				negative_feeling: datum.negative_feeling,
				latitude: datum.latitude,
				longitude: datum.longitude)
		else
			lastdatum_from_datum_new_item_array.last.update(
				devise: datum.devise, 
				PM2_5: datum.PM2_5, 
				PM10: datum.PM10,
				positive_feeling: datum.positive_feeling,
				mixed_feeling: datum.mixed_feeling, 
				negative_feeling: datum.negative_feeling)
		end
	end


	def self.update_from_GPSLogger(datum)
		lastdatum_from_datum_new_item_array = LastDatum.where(devise: datum.devise)
		unless lastdatum_from_datum_new_item_array.size == 0
			lastdatum_from_datum_new_item_array.last.update(
				latitude: datum.latitude,
				longitude: datum.longitude)
		end
	end
end
