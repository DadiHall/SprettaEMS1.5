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

ActiveRecord::Schema.define(version: 20160215150449) do

  create_table "cleanings", force: :cascade do |t|
    t.datetime "date"
    t.string   "cleaning_type"
    t.decimal  "cleaning_liter"
    t.decimal  "cleaning_cost"
    t.decimal  "cleaning_liter_staff_ratio"
    t.integer  "user_id"
    t.decimal  "env_clean_ratio"
  end

  create_table "electros", force: :cascade do |t|
    t.datetime "date"
    t.string   "building_name"
    t.decimal  "electricity_kwst"
    t.decimal  "electricity_cost"
    t.decimal  "kwst_staff_ratio"
    t.decimal  "kwst_square_meter_ratio"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "garbages", force: :cascade do |t|
    t.datetime "date"
    t.string   "trash_type"
    t.decimal  "trash_weight"
    t.decimal  "trash_cost"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "hwaters", force: :cascade do |t|
    t.datetime "date"
    t.string   "building_name"
    t.decimal  "hot_water_cost"
    t.decimal  "hot_water_cubic_meter"
    t.decimal  "hot_water_m2_m3_ratio"
    t.decimal  "hot_water_m3_staff_ratio"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "paper_type"
    t.decimal  "paper_weight"
    t.decimal  "paper_cost"
    t.decimal  "paper_weight_staff_ratio"
    t.decimal  "env_paper_weight"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "date"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "postalcode"
    t.string   "website"
    t.string   "contact_person"
    t.string   "contact_email"
    t.string   "phone_number"
    t.string   "buisness_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "building_size"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "transports", force: :cascade do |t|
    t.datetime "date"
    t.string   "transport_type"
    t.decimal  "transport_km"
    t.decimal  "transport_num_of_trips"
    t.decimal  "transport_km_recycled_fuel"
    t.decimal  "transport_co2"
    t.decimal  "transport_km_staff_ratio"
    t.decimal  "transport_co2_staff_ratio"
    t.string   "transport_flight_type"
    t.decimal  "transport_flight_km"
    t.decimal  "transport_flight_co2"
    t.decimal  "transport_flight_km_staff_ratio"
    t.decimal  "transport_flight_co2_staff_ratio"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "staff"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
