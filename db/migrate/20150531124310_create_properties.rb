class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string  :title
      t.string  :image
      t.string  :street_address
      t.string  :city
      t.string  :state
      t.string  :country
      t.text    :description
      t.integer :property_type_id
      t.float   :rent
      t.integer :beds
      t.integer :baths
      t.integer :max_people
      t.integer :min_stay
      t.time    :check_in_time
      t.time    :check_out_time
      t.boolean :pets
      t.integer :user_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
