class Course < ActiveRecord::Base
	has_many :enrollments
	has_many :users, through: :enrollments

	SESSIONS = %i[Winter Spring Summer Fall]
	COURSE_STATUS = %[Active Inactive]
	STUDENT_STATUS = %[Active Passed Failed Withdrawn]
end
