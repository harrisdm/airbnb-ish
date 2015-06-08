# == Schema Information
#
# Table name: properties
#
#  id               :integer          not null, primary key
#  title            :string
#  image            :string
#  address          :text
#  latitude         :float
#  longitude        :float
#  description      :text
#  property_type_id :integer
#  rent             :float
#  beds             :integer
#  baths            :integer
#  max_people       :integer
#  min_stay         :integer
#  check_in_time    :time
#  check_out_time   :time
#  pets             :boolean
#  user_id          :integer
#  active           :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cleaning_fee     :float
#

class Property < ActiveRecord::Base

  belongs_to :user
  belongs_to :property_type
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  scope :active, -> { where(:active => true).order("id ASC") }

  validates :title, :presence => true
  validates :address, :presence => true
  validates :rent, :presence => true
  validates :cleaning_fee, :presence => true
  validates :beds, :presence => true
  validates :baths, :presence => true
  validates :max_people, :presence => true
  validates :min_stay, :presence => true
  validates :check_in_time, :presence => true
  validates :check_out_time, :presence => true

end
