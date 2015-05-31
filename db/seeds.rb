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


s1 = BookingStatus.create :name => "Pending"
s2 = BookingStatus.create :name => "Accepted"
s3 = BookingStatus.create :name => "Declined"
s4 = BookingStatus.create :name => "Cancelled"

t1 = PropertyType.create :name => "Entire Place"
t2 = PropertyType.create :name => "Private Room"
t3 = PropertyType.create :name => "Shared Room"

u1 = User.create :first_name => "Mark", :last_name => "Harris", :email => "harrisdm@hotmail.com", :password_digest =>"$2a$10$4vE0VSa31ygDLYJcWivfl.5CTitod9MpRP.9riAKF5XBXgP3oWS4."
u2 = User.create :first_name => "Test", :last_name => "User 1", :email => "1@u.com", :password_digest =>"$2a$10$F3IuDGSXg3cwFlU3juX4PuZXInksI6tVTwE0h4hUIUMhQ6w1FY2oi" #123
u3 = User.create :first_name => "Test", :last_name => "User 2", :email => "2@u.com", :password_digest =>"$2a$10$F3IuDGSXg3cwFlU3juX4PuZXInksI6tVTwE0h4hUIUMhQ6w1FY2oi" #123

