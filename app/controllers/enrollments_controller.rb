class EnrollmentsController < ApplicationController
	before_action :require_login
  check_authorization
  authorize_resource :only => [:index, :filter_courses, :enroll_users]


	def filter_courses
    @courses = Course.where("session = :session AND start_date >= :start_date AND end_date <= :end_date",
      { session: params[:session], start_date: params[:start_date], end_date: params[:end_date] })

    render partial: 'filtered_courses'
  end

  def enroll_users
    user_ids = params[:users]
    course_ids = params[:courses]
    course_ids.each do |course_id|
      user_ids.each do |user_id|
        Enrollment.create(
          user_id: id, 
          course_id: course_id, 
          course_status: Course.COURSE_STATUS.index("Active"),
          student_status: Course.STUDENT_STATUS.index("Active")
        )
      end
    end
  end

  def index
  	@user_type = params[:user]
  	if @user_type == 'student'
    	@users = User.where(role: User::ROLES.index(:Student), status: User::STATUS.index(:Active))
    	@user_type = 'Students' 
    else
    	@users = User.where(role: User::ROLES.index(:Instructor), status: User::STATUS.index(:Active))
    	@user_type = 'Instructors'
    end
  end
end