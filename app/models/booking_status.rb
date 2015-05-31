# == Schema Information
#
# Table name: booking_statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class BookingStatus < ActiveRecord::Base

  has_many :bookings

end
