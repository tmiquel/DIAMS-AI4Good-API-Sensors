class Location < ApplicationRecord
	after_create -> { link_pos(self.get_last_datum) }

	def link_pos(datum)
		if datum
			if self.matches?(datum, 60)
				datum.update_attributes(latitude: self.latitude, longitude: self.longitude)
				datum.save
			end
		end
	end

	def get_last_datum
		Datum.where(device: self.device).last
	end

	def matches?(datum, seuil)
		return ((self.created_at - datum.created_at) < seuil)
	end

end
