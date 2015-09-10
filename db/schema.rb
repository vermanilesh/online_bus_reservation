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

ActiveRecord::Schema.define(version: 20150909140125) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "agencies", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "agencies", ["email"], name: "index_agencies_on_email", unique: true
  add_index "agencies", ["reset_password_token"], name: "index_agencies_on_reset_password_token", unique: true

  create_table "agencies_routes", force: true do |t|
    t.integer "agency_id"
    t.integer "route_id"
  end

  add_index "agencies_routes", ["agency_id"], name: "index_agencies_routes_on_agency_id"
  add_index "agencies_routes", ["route_id"], name: "index_agencies_routes_on_route_id"

  create_table "agency_routes", force: true do |t|
    t.integer  "agency_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agency_routes", ["agency_id"], name: "index_agency_routes_on_agency_id"
  add_index "agency_routes", ["route_id"], name: "index_agency_routes_on_route_id"

  create_table "buses", force: true do |t|
    t.string   "bus_type"
    t.integer  "seats"
    t.integer  "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_number"
    t.integer  "route_id"
    t.string   "avatar"
  end

  add_index "buses", ["agency_id"], name: "index_buses_on_agency_id"
  add_index "buses", ["route_id"], name: "index_buses_on_route_id"

  create_table "routes", force: true do |t|
    t.string   "from_station"
    t.string   "to_station"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agency_id"
  end

  add_index "routes", ["agency_id"], name: "index_routes_on_agency_id"

  create_table "schedules", force: true do |t|
    t.time     "departure_time"
    t.time     "arrival_time"
    t.integer  "fare"
    t.integer  "agency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bus_number"
    t.string   "route"
    t.integer  "route_id"
    t.integer  "days_mask"
    t.string   "day"
  end

  add_index "schedules", ["route_id"], name: "index_schedules_on_route_id"

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
