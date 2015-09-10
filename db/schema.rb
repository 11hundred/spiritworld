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

ActiveRecord::Schema.define(version: 20150910165545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_events", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "type"
    t.string   "url"
    t.text     "content"
    t.integer  "time_start"
    t.integer  "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_events", ["post_id"], name: "index_post_events_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "is_podcast",               default: false
    t.integer  "episode_id"
    t.boolean  "show_notes_match_content", default: true
    t.text     "show_notes"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "audio_file_url"
    t.datetime "publish_timestamp",        default: '2015-09-03 22:01:32', null: false
    t.boolean  "published",                default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "post_events", "posts"
end
