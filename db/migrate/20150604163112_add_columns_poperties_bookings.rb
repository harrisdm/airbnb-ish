class AddColumnsPopertiesBookings < ActiveRecord::Migration
  def change
    add_column :properties, :cleaning_fee, :float

    add_column :bookings, :rent, :float
    add_column :bookings, :cleaning_fee, :float
    add_column :bookings, :service_fee, :float
    add_column :bookings, :guest_count, :integer
    add_column :bookings, :check_in_time, :time
    add_column :bookings, :check_out_time, :time

  end
end
