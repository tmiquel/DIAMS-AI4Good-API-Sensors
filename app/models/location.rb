class Location < ApplicationRecord
	after_create -> { link_pos(self.get_last_datum) }

	def link_pos(datum)
		if datum
			if self.matches?(datum, 30)
				datum.update_atributes(latitude: self.latitude, longitude: self.longitude)
			end
		end
	end

	def get_last_datum
		Datum.where(devise: self.device).last
	end

	def matches?(datum, seuil)
		return ((self.created_at - datum.created_at) < seuil)
	end

end
