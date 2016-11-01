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

ActiveRecord::Schema.define(version: 20161027220710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "editSchedule"
    t.boolean  "acceptDenyShift"
    t.boolean  "scheduleable"
    t.integer  "store_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["store_id"], name: "index_positions_on_store_id", using: :btree
  end

  create_table "positions_users", id: false, force: :cascade do |t|
    t.integer "position_id", null: false
    t.integer "user_id",     null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["schedule_id"], name: "index_requests_on_schedule_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.boolean  "available"
    t.date     "date"
    t.time     "startTime"
    t.time     "endTime"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["position_id"], name: "index_schedules_on_position_id", using: :btree
    t.index ["user_id"], name: "index_schedules_on_user_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.string   "email"
    t.string   "companyName"
    t.string   "address"
    t.string   "zipCode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "firstName"
    t.string   "lastName"
    t.boolean  "active"
    t.boolean  "admin"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "store_id"
    t.index ["store_id"], name: "index_users_on_store_id", using: :btree
  end

  add_foreign_key "positions", "stores"
  add_foreign_key "requests", "schedules"
  add_foreign_key "requests", "users"
  add_foreign_key "schedules", "positions"
  add_foreign_key "schedules", "users"
  add_foreign_key "users", "stores"
end
