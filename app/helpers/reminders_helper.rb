module RemindersHelper

	def recipient_options_for_reminders(property)
		return property.users unless property.nil?
		return current_user.followers || nil
	end

end
