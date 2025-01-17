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

ActiveRecord::Schema.define(version: 20200222064507) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "place"
    t.time     "starttime"
    t.time     "endtime"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "release"
    t.date     "day"
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "content"
    t.string   "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "fees", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "price"
    t.text     "text"
    t.string   "release"
  end

  create_table "informations", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "release"
  end

  create_table "news", force: :cascade do |t|
    t.text     "content"
    t.string   "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "work"
    t.integer  "age"
    t.text     "content"
    t.string   "place"
    t.string   "area"
    t.string   "hobby"
    t.text     "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "user_id"
    t.text     "career"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
