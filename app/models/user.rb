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

  ROLES = %i[guest student instructor admin]

  def student?
    role == 'student'
  end

  def instructor?
    role == 'instructor'
  end

  def admin?
    role == 'admin'
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
