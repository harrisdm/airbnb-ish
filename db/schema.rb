# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150604163112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: :cascade do |t|
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "user_id"
    t.integer  "property_id"
    t.integer  "booking_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rent"
    t.float    "cleaning_fee"
    t.float    "service_fee"
    t.string   "guests"
    t.time     "check_in_time"
    t.time     "check_out_time"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.integer  "property_type_id"
    t.float    "rent"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "max_people"
    t.integer  "min_stay"
    t.time     "check_in_time"
    t.time     "check_out_time"
    t.boolean  "pets"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "cleaning_fee"
  end

  create_table "property_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
