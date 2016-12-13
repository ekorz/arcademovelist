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

ActiveRecord::Schema.define(version: 20161213003638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "builds", force: true do |t|
    t.boolean  "moves"
    t.boolean  "fatalities"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "builds", ["tab_id"], name: "index_builds_on_tab_id", using: :btree

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["tab_id"], name: "index_characters_on_tab_id", using: :btree

  create_table "fatalities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fatalities", ["tab_id"], name: "index_fatalities_on_tab_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moves", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "moves", ["tab_id"], name: "index_moves_on_tab_id", using: :btree

  create_table "notes", force: true do |t|
    t.text     "description"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["tab_id"], name: "index_notes_on_tab_id", using: :btree

  create_table "setups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tab_id"
    t.boolean  "kick_harness"
    t.boolean  "jamma"
    t.text     "button_layout"
    t.string   "region"
  end

  add_index "setups", ["tab_id"], name: "index_setups_on_tab_id", using: :btree

  create_table "tabs", force: true do |t|
    t.integer  "tabable_id"
    t.string   "tabable_type"
    t.string   "tab_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tabs", ["tabable_id", "tabable_type"], name: "index_tabs_on_tabable_id_and_tabable_type", using: :btree

end
