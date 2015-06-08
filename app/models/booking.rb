# == Schema Information
#
# Table name: bookings
#
#  id                :integer          not null, primary key
#  check_in          :date
#  check_out         :date
#  user_id           :integer
#  property_id       :integer
#  booking_status_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#  rent              :float
#  cleaning_fee      :float
#  service_fee       :float
#  check_in_time     :time
#  check_out_time    :time
#  guest_count       :integer
#

class Booking < ActiveRecord::Base

  belongs_to :user
  belongs_to :property
  belongs_to :booking_status  

  scope :upComing, -> { where("check_in > ?", Date.today).order("check_in ASC") }

  validates :check_in, :presence => true
  validates :check_out, :presence => true

end
