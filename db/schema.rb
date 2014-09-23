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

ActiveRecord::Schema.define(version: 20140923103501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.text     "name",                  null: false
    t.text     "source"
    t.integer  "start_page",            null: false
    t.integer  "finish_page",           null: false
    t.text     "link"
    t.integer  "year",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "fields", force: true do |t|
    t.text     "name",                 null: false
    t.string   "code",       limit: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grntis", force: true do |t|
    t.string   "grnti",      limit: 2, null: false
    t.text     "name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nir_types", force: true do |t|
    t.string   "name",       limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "last_name",    limit: 64, null: false
    t.string   "first_name",   limit: 64, null: false
    t.string   "second_name",  limit: 64
    t.text     "external_ids"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.text     "funding_source", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "state_programs", force: true do |t|
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
