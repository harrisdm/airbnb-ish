# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BookingStatus.destroy_all
PropertyType.destroy_all
User.destroy_all
Property.destroy_all


s1 = BookingStatus.create :name => "Pending"
s2 = BookingStatus.create :name => "Accepted"
s3 = BookingStatus.create :name => "Declined"
s4 = BookingStatus.create :name => "Cancelled"

t1 = PropertyType.create :name => "Entire Place"
t2 = PropertyType.create :name => "Private Room"
t3 = PropertyType.create :name => "Shared Room"

u1 = User.create :name => "Mark Harris", :email => "harrisdm@hotmail.com", :password_digest =>"$2a$10$4vE0VSa31ygDLYJcWivfl.5CTitod9MpRP.9riAKF5XBXgP3oWS4."
u2 = User.create :name => "Test User 1", :email => "1@u.com", :password_digest =>"$2a$10$F3IuDGSXg3cwFlU3juX4PuZXInksI6tVTwE0h4hUIUMhQ6w1FY2oi" #123
u3 = User.create :name => "Test User 2", :email => "2@u.com", :password_digest =>"$2a$10$F3IuDGSXg3cwFlU3juX4PuZXInksI6tVTwE0h4hUIUMhQ6w1FY2oi" #123


p1 = Property.create :title => "My House", :address => "179 Lord Street, Sydney", :description => "My house bitches", :property_type_id => 1, :rent => 300.0, :beds => 3, :baths => 2, :max_people => 5, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p2 = Property.create :title => "Luxury Suite", :address => "10 Lord Street, Sydney", :description => "Nice House", :property_type_id => 1, :rent => 400.0, :beds => 1, :baths => 2, :max_people => 3, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p3 = Property.create :title => "2 bdrm", :address => "64 Edgeware, Sydney", :description => "Blah blah blah", :property_type_id => 1, :rent => 250.0, :beds => 2, :baths => 1, :max_people => 4, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p4 = Property.create :title => "1 bdrm", :address => "11 Salisbury Road, Sydney", :description => "Blah blah blah", :property_type_id => 1, :rent => 250.0, :beds => 2, :baths => 1, :max_people => 4, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p5 = Property.create :title => "3 bdrm", :address => "97 Young Street, Sydney", :description => "Blah blah blah", :property_type_id => 1, :rent => 250.0, :beds => 2, :baths => 1, :max_people => 4, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p6 = Property.create :title => "4 bdrm Glebe", :address => "34 Glebe Point Road, Sydney", :description => "Blah blah blah", :property_type_id => 1, :rent => 250.0, :beds => 2, :baths => 1, :max_people => 4, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p7 = Property.create :title => "2 bdrm", :address => "21 Russell Street, Melbourne", :description => "Blah blah blah", :property_type_id => 1, :rent => 250.0, :beds => 2, :baths => 1, :max_people => 4, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true

p8 = Property.create :title => "3 bdrm", :address => "120 Flinders Street, Melbourne", :description => "Blah blah blah", :property_type_id => 1, :rent => 250.0, :beds => 2, :baths => 1, :max_people => 4, :min_stay => 3, :check_in_time => "2000-01-01 16:00:00 UTC", :check_out_time => "2000-01-01 11:00:00 UTC", :pets => false, :user_id => 1, :active => true







