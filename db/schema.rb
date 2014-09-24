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

ActiveRecord::Schema.define(version: 20140923133645) do

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

  create_table "research_effort_files", force: true do |t|
    t.text     "description"
    t.integer  "research_effort_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  add_index "research_effort_files", ["research_effort_id"], name: "index_research_effort_files_on_research_effort_id", using: :btree

  create_table "research_efforts", force: true do |t|
    t.text     "name",                                      null: false
    t.integer  "state_program_id",                          null: false
    t.date     "start_date",                                null: false
    t.date     "finish_date",                               null: false
    t.integer  "grnti_id",                                  null: false
    t.integer  "field_id",                                  null: false
    t.decimal  "full_value",        precision: 5, scale: 2
    t.text     "year_value"
    t.integer  "state_reg_number",                          null: false
    t.integer  "nir_number",                                null: false
    t.integer  "inventory_number",                          null: false
    t.integer  "nir_type_id",                               null: false
    t.integer  "source_id",                                 null: false
    t.text     "scientific_school",                         null: false
    t.boolean  "is_nir",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "research_efforts", ["field_id"], name: "index_research_efforts_on_field_id", using: :btree
  add_index "research_efforts", ["grnti_id"], name: "index_research_efforts_on_grnti_id", using: :btree
  add_index "research_efforts", ["nir_type_id"], name: "index_research_efforts_on_nir_type_id", using: :btree
  add_index "research_efforts", ["source_id"], name: "index_research_efforts_on_source_id", using: :btree
  add_index "research_efforts", ["state_program_id"], name: "index_research_efforts_on_state_program_id", using: :btree

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
