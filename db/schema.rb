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

ActiveRecord::Schema.define(version: 20141021105600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_authors", force: true do |t|
    t.integer  "article_id",                 null: false
    t.integer  "person_id",                  null: false
    t.string   "old_lastname",    limit: 64, null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_authors", ["article_id", "person_id"], name: "index_article_authors_on_article_id_and_person_id", unique: true, using: :btree
  add_index "article_authors", ["article_id"], name: "index_article_authors_on_article_id", using: :btree
  add_index "article_authors", ["person_id"], name: "index_article_authors_on_person_id", using: :btree

  create_table "articles", force: true do |t|
    t.text     "name",          null: false
    t.text     "source"
    t.integer  "start_page",    null: false
    t.integer  "finish_page",   null: false
    t.text     "link"
    t.integer  "year",          null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["name"], name: "index_articles_on_name", unique: true, using: :btree

  create_table "authors", force: true do |t|
    t.integer  "article_id",                 null: false
    t.integer  "person_id",                  null: false
    t.string   "old_lastname",    limit: 64
    t.boolean  "lecturer"
    t.boolean  "senior_lecturer"
    t.boolean  "student"
    t.boolean  "postgrad"
    t.text     "details"
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["article_id"], name: "index_authors_on_article_id", using: :btree
  add_index "authors", ["person_id"], name: "index_authors_on_person_id", using: :btree

  create_table "conferences", force: true do |t|
    t.text     "name",          null: false
    t.text     "country"
    t.text     "city"
    t.date     "start"
    t.date     "finish"
    t.integer  "year",          null: false
    t.text     "ctype",         null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "creator_login"
    t.text     "creator_data"
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

  add_index "fields", ["code"], name: "index_fields_on_code", unique: true, using: :btree

  create_table "grntis", force: true do |t|
    t.string   "grnti",      limit: 8, null: false
    t.text     "name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grntis", ["grnti"], name: "index_grntis_on_grnti", unique: true, using: :btree

  create_table "licences", force: true do |t|
    t.string   "number",             limit: 16, null: false
    t.date     "reg_date",                      null: false
    t.string   "type",               limit: 32, null: false
    t.text     "name",                          null: false
    t.date     "expiration_date"
    t.string   "req_number"
    t.text     "req_author"
    t.text     "req_object"
    t.string   "req_status"
    t.string   "reg_agency"
    t.date     "req_priority"
    t.string   "support"
    t.integer  "research_effort_id"
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "licences", ["research_effort_id"], name: "index_licences_on_research_effort_id", using: :btree

  create_table "nir_types", force: true do |t|
    t.string   "name",       limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nir_types", ["name"], name: "index_nir_types_on_name", unique: true, using: :btree

  create_table "ois_requests", force: true do |t|
    t.string   "number",                                    null: false
    t.date     "priority",                                  null: false
    t.text     "author",                                    null: false
    t.text     "name",                                      null: false
    t.text     "object",                                    null: false
    t.string   "reg_agency",                                null: false
    t.integer  "research_effort_id"
    t.string   "status",             default: "российская", null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ois_requests", ["research_effort_id"], name: "index_ois_requests_on_research_effort_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "last_name",    limit: 64, null: false
    t.string   "first_name",   limit: 64, null: false
    t.string   "second_name",  limit: 64
    t.text     "external_ids"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.text     "title"
    t.integer  "conference_id", null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["conference_id"], name: "index_reports_on_conference_id", using: :btree

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
    t.boolean  "is_nir",                                        null: false
    t.string   "creator_login"
    t.text     "creator_data"
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

  create_table "users", force: true do |t|
    t.string   "login",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
