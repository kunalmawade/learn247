class WelcomeController < ApplicationController
	def show
		@courses = current_user.enrollments.where(course_status: 'enrolled')
	end

	def index

	end
end
