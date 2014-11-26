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

ActiveRecord::Schema.define(version: 20141126020503) do

  create_table "tickets", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "finished"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignee_id"
  end

  add_index "tickets", ["assignee_id"], name: "tickets_assignee_id_fk", using: :btree

  create_table "users", force: true do |t|
    t.string   "nickname",        limit: 30, null: false
    t.string   "password_digest", limit: 60, null: false
    t.string   "first_name",      limit: 30
    t.string   "last_name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "tickets", "users", name: "tickets_assignee_id_fk", column: "assignee_id"

end
