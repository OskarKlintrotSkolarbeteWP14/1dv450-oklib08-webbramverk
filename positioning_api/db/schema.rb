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

ActiveRecord::Schema.define(version: 20160222183537) do

  create_table "apikey_dashboard_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "application", limit: 25, null: false
    t.string   "api_key",     limit: 50, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "apikey_dashboard_users", force: :cascade do |t|
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest",             null: false
    t.string   "first_name",      limit: 20
    t.string   "last_name",       limit: 30
    t.boolean  "admin",                       null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string   "username",                   null: false
    t.string   "email",                      null: false
    t.string   "first_name",      limit: 20
    t.string   "last_name",       limit: 30
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ops", force: :cascade do |t|
    t.integer  "position_id"
    t.integer  "tag_id"
    t.integer  "creator_id"
    t.string   "item",        null: false
    t.string   "note"
    t.datetime "datetime"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "lng",        null: false
    t.string   "lat",        null: false
    t.string   "place",      null: false
    t.string   "region",     null: false
    t.string   "country",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
