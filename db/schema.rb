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

ActiveRecord::Schema.define(version: 2020_03_03_011335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: :cascade do |t|
    t.string "gender"
    t.integer "age"
    t.integer "blood_pressure"
    t.integer "pulse"
    t.float "temperature"
    t.float "spa02"
    t.bigint "user_id"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "details"
    t.index ["hospital_id"], name: "index_calls_on_hospital_id"
    t.index ["user_id"], name: "index_calls_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.jsonb "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_conditions_on_category_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "unit"
    t.bigint "hospital_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calls", "hospitals"
  add_foreign_key "calls", "users"
  add_foreign_key "conditions", "categories"
  add_foreign_key "users", "hospitals"
end
