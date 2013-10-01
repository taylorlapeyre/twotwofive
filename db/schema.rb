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

ActiveRecord::Schema.define(version: 20131001022252) do

  create_table "amenity_lists", force: true do |t|
    t.integer  "listing_id"
    t.boolean  "basketball_court"
    t.boolean  "club_house"
    t.boolean  "game_room"
    t.boolean  "gated_community"
    t.boolean  "gym"
    t.boolean  "handicap_accessible"
    t.boolean  "media_center"
    t.boolean  "pool"
    t.boolean  "public_bus_route"
    t.boolean  "spa"
    t.boolean  "storage_space"
    t.boolean  "tanning_bed"
    t.boolean  "tennis_court"
    t.boolean  "university_bus_route"
    t.boolean  "volleyball_court"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feature_lists", force: true do |t|
    t.integer  "floorplan_id"
    t.boolean  "alarm_system"
    t.boolean  "cats_allowed"
    t.boolean  "central_air"
    t.boolean  "covered_parking"
    t.boolean  "deck_patio"
    t.boolean  "dishwasher"
    t.boolean  "dogs_allowed"
    t.boolean  "elevator"
    t.boolean  "fireplace"
    t.boolean  "hardwood_floors"
    t.boolean  "new_appliances"
    t.boolean  "on_street_parking"
    t.boolean  "parking_garage"
    t.boolean  "private_garage"
    t.boolean  "private_yard"
    t.boolean  "reserved_parking"
    t.boolean  "shared_yard"
    t.boolean  "vaulted_ceilings"
    t.boolean  "walk_in_closet"
    t.boolean  "washer_dryer"
    t.boolean  "wifi_included"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floorplans", force: true do |t|
    t.integer  "listing_id"
    t.string   "name"
    t.integer  "num_bathrooms"
    t.integer  "num_bedrooms"
    t.integer  "rent"
    t.string   "rent_type"
    t.integer  "square_footage"
    t.integer  "deposit"
    t.integer  "lease_term"
    t.string   "lease_type"
    t.boolean  "active",         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.integer  "listing_id"
    t.integer  "floorplan_id"
  end

  create_table "landlords", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "company_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "landlords", ["remember_token"], name: "index_landlords_on_remember_token"

  create_table "listings", force: true do |t|
    t.string   "building_name"
    t.string   "address"
    t.string   "zip"
    t.text     "descrption"
    t.string   "contact_email"
    t.string   "phone_number"
    t.string   "website_url"
    t.boolean  "featured",                 default: false
    t.string   "slug"
    t.string   "geocode"
    t.boolean  "active",                   default: true
    t.integer  "neighborhood_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
  end

  create_table "managements", force: true do |t|
    t.integer  "landlord_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
