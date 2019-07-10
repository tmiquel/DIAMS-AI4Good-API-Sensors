class Location < ApplicationRecord
	after_create -> { link_pos(get_last_datum(self)) }

	def matches?(datum, seuil)
		if ((self.created_at  - datum.created_at) < seuil)
			return true
		else
			return false
		end
	end

	def link_pos(datum)
		if self.matches?(datum, 30)
			datum.latitude = self.latitude
			datum.longitude = self.longitude
			datum.save
		end
	end

	def get_last_datum(location)
		Datum.where(devise: self.device).last
	end

end
