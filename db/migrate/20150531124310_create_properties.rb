class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string  :title
      t.string  :image            :default => "https://d1luk0418egahw.cloudfront.net/static/images/guide/NoImage_592x444.jpg"
      t.text    :address
      t.float   :latitude
      t.float   :longitude
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
