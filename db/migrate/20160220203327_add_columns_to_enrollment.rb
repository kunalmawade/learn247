class AddColumnsToEnrollment < ActiveRecord::Migration
  def change
  	add_column :enrollments, :course_id, :integer
  	add_column :enrollments, :user_id, :integer
  end
end
