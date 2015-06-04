# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  image           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  has_many :bookings
  has_many :properties

  has_secure_password
  validates :name, :presence => true
  validates :email, :uniqueness => true
  
end
