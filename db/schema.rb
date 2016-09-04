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

ActiveRecord::Schema.define(version: 20160903235642) do

  create_table "activities", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "link"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tags"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "published"
    t.boolean  "deleted"
    t.index ["event_id"], name: "index_activities_on_event_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
    t.integer  "state_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "type"
    t.string   "distance"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_disciplines_on_activity_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "category_id"
    t.string   "link"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "tags"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "published"
    t.boolean  "deleted"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["city_id"], name: "index_events_on_city_id"
    t.index ["country_id"], name: "index_events_on_country_id"
    t.index ["state_id"], name: "index_events_on_state_id"
  end

  create_table "events_users_favorites", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_events_users_favorites_on_event_id"
    t.index ["user_id"], name: "index_events_users_favorites_on_user_id"
  end

  create_table "events_users_registers", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_events_users_registers_on_event_id"
    t.index ["user_id"], name: "index_events_users_registers_on_user_id"
  end

  create_table "social_network_profiles", force: :cascade do |t|
    t.string   "provider"
    t.string   "access_token"
    t.string   "refresh_token"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_social_network_profiles_on_user_id"
  end

  create_table "social_providers", force: :cascade do |t|
    t.string   "provider"
    t.string   "link"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_social_providers_on_event_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_name"
    t.string   "password"
    t.date     "birthdate"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

end
