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

ActiveRecord::Schema.define(version: 2020_06_30_232223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_invites_on_group_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "day", default: "", null: false
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_rooms_on_group_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.string "start_time", default: "", null: false
    t.string "end_time", default: "", null: false
    t.bigint "room_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_timetables_on_room_id"
    t.index ["user_id"], name: "index_timetables_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "timetable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timetable_id"], name: "index_votes_on_timetable_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "groups", "users"
  add_foreign_key "invites", "groups"
  add_foreign_key "invites", "users"
  add_foreign_key "rooms", "groups"
  add_foreign_key "rooms", "users"
  add_foreign_key "timetables", "rooms"
  add_foreign_key "timetables", "users"
  add_foreign_key "votes", "timetables"
  add_foreign_key "votes", "users"
end
