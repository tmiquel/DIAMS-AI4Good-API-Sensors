class Location < ApplicationRecord
	after_create -> { link_pos(self, self.get_last_datum) }

	def matches?(datum, seuil)
		puts "ù"*660
		puts datum.created_at
		if ((self.created_at - datum.created_at) < seuil)
			return true
		else
			return false
		end
	end

	def link_pos(location, datum)
		if location.matches?(datum, 30)
			datum.latitude = self.latitude
			datum.longitude = self.longitude
			datum.save
		end
	end

	def get_last_datum
		return Datum.where(devise: self.device).last
	end

end
