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

ActiveRecord::Schema.define(version: 20141115172026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "environments", force: true do |t|
    t.string   "name"
    t.integer  "service_id"
    t.string   "api_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "environments", ["service_id"], name: "index_environments_on_service_id", using: :btree

  create_table "failures", force: true do |t|
    t.integer  "environment_id"
    t.string   "message"
    t.string   "hostname"
    t.string   "error_type"
    t.text     "backtrace",      default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "failures", ["environment_id"], name: "index_failures_on_environment_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "revoked_at"
    t.string   "key",        null: false
  end

  add_index "sessions", ["key"], name: "index_sessions_on_key", using: :btree
  add_index "sessions", ["revoked_at"], name: "index_sessions_on_revoked_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "uri"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
