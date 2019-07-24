class DatumMailer < ApplicationMailer
	default from: 'no-reply@simple-ai4good-sensors-api.herokuapp.com'

	def backup_mailer(emails_array)
		@data = Datum.all
		@time = Time.new.inspect
		emails_array.each do |email|
			mail(to: email, subject: "#{@time} database backup for 'simple-ai4good-sensors-api'") 
		end
	end

end
