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

ActiveRecord::Schema.define(version: 20140210015004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "asset_links", force: true do |t|
    t.integer "domain_id"
    t.integer "source_id"
    t.integer "asset_id"
  end

  create_table "assets", force: true do |t|
    t.string  "type"
    t.string  "state"
    t.string  "path"
    t.integer "domain_id"
  end

  create_table "domains", force: true do |t|
    t.string   "url"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.integer "domain_id"
    t.integer "source_id"
    t.integer "target_id"
    t.string  "path"
    t.string  "text"
  end

  create_table "pages", force: true do |t|
    t.integer  "domain_id"
    t.string   "path"
    t.string   "state"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["domain_id", "path"], name: "index_pages_on_domain_id_and_path", unique: true, using: :btree

end
