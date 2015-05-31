class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date      :check_in
      t.date      :check_out
      t.integer   :user_id
      t.integer   :property_id
      t.integer   :booking_status_id

      t.timestamps
    end
  end
end
