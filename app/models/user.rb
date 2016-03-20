# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#

class User < ActiveRecord::Base
  include Clearance::User

  after_create :add_profile
  has_one :profile
  has_many :enrollments
  has_many :courses, through: :enrollments

  ROLES = %i[Guest Student Instructor Admin]

  STATUS = %i[Active Blocked]

  def student?
    role == ROLES.index(:Student)
  end

  def instructor?
    role == ROLES.index(:Instructor)
  end

  def admin?
    role == ROLES.index(:Admin)
  end

  def guest?
    role == ROLES.index(:Guest)
  end
  
  def sign_in(user)
    user.reset_remember_token! if user
    super
  end

  private

  def add_profile
  	Profile.create!.user = self
  end
end
