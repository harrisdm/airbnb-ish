# == Schema Information
#
# Table name: properties
#
#  id               :integer          not null, primary key
#  title            :string
#  image            :string
#  street_address   :string
#  city             :string
#  state            :string
#  country          :string
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
#

class Property < ActiveRecord::Base

  belongs_to :user
  belongs_to :property_type

end