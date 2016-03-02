class WelcomeController < ApplicationController
	def show
		@courses = current_user.enrollments.where(course_status: 'enrolled')
		# if current_user.student?
		# 	render partial: 'student_home'
		# elsif current_user.instructor?
		# 	render partial: 'instructor_home'
		# elsif current_user.admin?
		# 	render partial: 'admin_home'
		#end
		
	end

	def index

	end
end
