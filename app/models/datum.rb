class Datum < ApplicationRecord
    validates_presence_of :devise


    def self.get_last(devise_name)
    	return Datum.where(devise: devise_name).last
    end

end
