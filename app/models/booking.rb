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
#

class Booking < ActiveRecord::Base

  belongs_to :user
  belongs_to :booking_status

end
