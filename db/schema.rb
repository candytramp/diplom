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

ActiveRecord::Schema.define(version: 20140929124148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.text     "name",        null: false
    t.text     "source"
    t.integer  "start_page",  null: false
    t.integer  "finish_page", null: false
    t.text     "link"
    t.integer  "year",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paper_file_name"
    t.string   "paper_content_type"
    t.integer  "paper_file_size"
    t.datetime "paper_updated_at"
  end

  add_index "documents", ["owner_id", "owner_type"], name: "index_documents_on_owner_id_and_owner_type", using: :btree

  create_table "fields", force: true do |t|
    t.text     "name",                 null: false
    t.string   "code",       limit: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["name", "code"], name: "index_fields_on_name_and_code", unique: true, using: :btree

  create_table "grntis", force: true do |t|
    t.string   "grnti",      limit: 8, null: false
    t.text     "name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grntis", ["grnti", "name"], name: "index_grntis_on_grnti_and_name", unique: true, using: :btree

  create_table "nir_types", force: true do |t|
    t.string   "name",       limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nir_types", ["name"], name: "index_nir_types_on_name", unique: true, using: :btree

  create_table "people", force: true do |t|
    t.string   "last_name",    limit: 64, null: false
    t.string   "first_name",   limit: 64, null: false
    t.string   "second_name",  limit: 64
    t.text     "external_ids"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "research_efforts", force: true do |t|
    t.text     "name",                                          null: false
    t.integer  "state_program_id",                              null: false
    t.date     "start_date",                                    null: false
    t.date     "finish_date",                                   null: false
    t.integer  "grnti_id",                                      null: false
    t.integer  "field_id",                                      null: false
    t.decimal  "full_value",           precision: 12, scale: 2
    t.text     "year_value"
    t.string   "state_reg_number"
    t.string   "nir_number"
    t.string   "inventory_number"
    t.integer  "nir_type_id",                                   null: false
    t.integer  "source_id",                                     null: false
    t.integer  "scientific_school_id",                          null: false
    t.boolean  "is_nir"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "research_efforts", ["field_id"], name: "index_research_efforts_on_field_id", using: :btree
  add_index "research_efforts", ["grnti_id"], name: "index_research_efforts_on_grnti_id", using: :btree
  add_index "research_efforts", ["name"], name: "index_research_efforts_on_name", unique: true, using: :btree
  add_index "research_efforts", ["nir_type_id"], name: "index_research_efforts_on_nir_type_id", using: :btree
  add_index "research_efforts", ["scientific_school_id"], name: "index_research_efforts_on_scientific_school_id", using: :btree
  add_index "research_efforts", ["source_id"], name: "index_research_efforts_on_source_id", using: :btree
  add_index "research_efforts", ["state_program_id"], name: "index_research_efforts_on_state_program_id", using: :btree

  create_table "scientific_schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scientific_schools", ["name"], name: "index_scientific_schools_on_name", unique: true, using: :btree

  create_table "sources", force: true do |t|
    t.text     "funding_source", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["funding_source"], name: "index_sources_on_funding_source", unique: true, using: :btree

  create_table "state_programs", force: true do |t|
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "state_programs", ["name"], name: "index_state_programs_on_name", unique: true, using: :btree

end
