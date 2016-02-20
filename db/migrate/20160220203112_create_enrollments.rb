class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :course_status
      t.string :user_status
      t.string :grade
      t.float :percentage

      t.timestamps null: false
    end
  end
end
