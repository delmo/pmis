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

ActiveRecord::Schema.define(version: 20140205182907) do

  create_table "activities", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "sector_id"
    t.integer  "issue_id"
    t.integer  "risk_id"
    t.integer  "report_id"
    t.integer  "source_id"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.integer  "rank"
    t.boolean  "visible",                                        default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["department_id"], name: "index_activities_on_department_id", using: :btree
  add_index "activities", ["issue_id"], name: "index_activities_on_issue_id", using: :btree
  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree
  add_index "activities", ["report_id"], name: "index_activities_on_report_id", using: :btree
  add_index "activities", ["risk_id"], name: "index_activities_on_risk_id", using: :btree
  add_index "activities", ["sector_id"], name: "index_activities_on_sector_id", using: :btree
  add_index "activities", ["source_id"], name: "index_activities_on_source_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "website"
    t.string   "email"
    t.text     "vision"
    t.text     "mission"
    t.text     "development_thrust"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.integer  "sector_id"
    t.string   "name"
    t.string   "description"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["sector_id"], name: "index_departments_on_sector_id", using: :btree

  create_table "issues", force: true do |t|
    t.string   "title"
    t.text     "implication"
    t.text     "intervention"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "sector_id"
    t.integer  "issue_id"
    t.integer  "risk_id"
    t.integer  "report_id"
    t.integer  "source_id"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.integer  "rank"
    t.boolean  "visible",                                        default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programs", ["department_id"], name: "index_programs_on_department_id", using: :btree
  add_index "programs", ["issue_id"], name: "index_programs_on_issue_id", using: :btree
  add_index "programs", ["report_id"], name: "index_programs_on_report_id", using: :btree
  add_index "programs", ["risk_id"], name: "index_programs_on_risk_id", using: :btree
  add_index "programs", ["sector_id"], name: "index_programs_on_sector_id", using: :btree
  add_index "programs", ["source_id"], name: "index_programs_on_source_id", using: :btree
  add_index "programs", ["user_id"], name: "index_programs_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.integer  "program_id"
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "sector_id"
    t.integer  "issue_id"
    t.integer  "risk_id"
    t.integer  "report_id"
    t.integer  "source_id"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.integer  "rank"
    t.boolean  "visible",                                        default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["department_id"], name: "index_projects_on_department_id", using: :btree
  add_index "projects", ["issue_id"], name: "index_projects_on_issue_id", using: :btree
  add_index "projects", ["program_id"], name: "index_projects_on_program_id", using: :btree
  add_index "projects", ["report_id"], name: "index_projects_on_report_id", using: :btree
  add_index "projects", ["risk_id"], name: "index_projects_on_risk_id", using: :btree
  add_index "projects", ["sector_id"], name: "index_projects_on_sector_id", using: :btree
  add_index "projects", ["source_id"], name: "index_projects_on_source_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "reports", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "risks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.text     "probability"
    t.text     "severity"
    t.text     "mitigation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.text     "description"
    t.text     "goal"
    t.text     "development_thrust"
    t.text     "objective"
    t.text     "desired_outcome"
    t.text     "required_policy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sectors", ["city_id"], name: "index_sectors_on_city_id", using: :btree

  create_table "sources", force: true do |t|
    t.string   "name"
    t.decimal  "personal_service",    precision: 12, scale: 2
    t.decimal  "mooe",                precision: 12, scale: 2
    t.decimal  "capital_outlay",      precision: 12, scale: 2
    t.decimal  "total",               precision: 16, scale: 2
    t.date     "implementation_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firt_name",       limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "username",        limit: 25
    t.string   "hashed_password", limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
