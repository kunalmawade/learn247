class Course < ActiveRecord::Base
	has_many :enrollments
	has_many :users, through: :enrollments

	SESSIONS = %i[Winter Spring Summer Fall]

end
