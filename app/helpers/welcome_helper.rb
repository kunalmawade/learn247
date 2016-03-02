module WelcomeHelper
	def user_name
		return nil if current_user.profile.first_name.blank? || current_user.profile.last_name.blank?
		full_name ||= current_user.profile.first_name + " " + current_user.profile.last_name
	end
end
