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

ActiveRecord::Schema.define(version: 20140507210955) do

  create_table "activities", force: true do |t|
    t.integer  "issue_id"
    t.integer  "project_id"
    t.integer  "source_id"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.decimal  "rank",                  precision: 6,  scale: 4
    t.boolean  "visible",                                        default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_risky"
    t.boolean  "not_in_line"
    t.boolean  "not_related"
    t.boolean  "not_pest"
    t.integer  "department_id"
  end

  add_index "activities", ["department_id"], name: "index_activities_on_department_id", using: :btree
  add_index "activities", ["issue_id"], name: "index_activities_on_issue_id", using: :btree
  add_index "activities", ["project_id"], name: "index_activities_on_project_id", using: :btree
  add_index "activities", ["source_id"], name: "index_activities_on_source_id", using: :btree

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.text     "post"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

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
    t.integer  "user_id"
  end

  create_table "departments", force: true do |t|
    t.integer  "sector_id"
    t.string   "name"
    t.text     "description"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "departments", ["sector_id"], name: "index_departments_on_sector_id", using: :btree

  create_table "in_lines", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "justification"
    t.integer  "achievable_id"
    t.string   "achievable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "in_lines", ["achievable_id", "achievable_type"], name: "index_in_lines_on_achievable_id_and_achievable_type", using: :btree

  create_table "issues", force: true do |t|
    t.integer  "department_id"
    t.string   "title"
    t.text     "implication"
    t.text     "intervention"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "issues", ["department_id"], name: "index_issues_on_department_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "portfolio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "locations", ["portfolio_id"], name: "index_locations_on_portfolio_id", using: :btree

  create_table "pests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "justification"
    t.integer  "feasible_id"
    t.string   "feasible_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pests", ["feasible_id", "feasible_type"], name: "index_pests_on_feasible_id_and_feasible_type", using: :btree

  create_table "portfolio_implements", force: true do |t|
    t.integer  "department_id"
    t.integer  "program_id"
    t.integer  "project_id"
    t.integer  "activity_id"
    t.date     "start"
    t.date     "completion"
    t.string   "financial_status"
    t.string   "work_status"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portfolio_implements", ["activity_id"], name: "index_portfolio_implements_on_activity_id", using: :btree
  add_index "portfolio_implements", ["department_id"], name: "index_portfolio_implements_on_department_id", using: :btree
  add_index "portfolio_implements", ["program_id"], name: "index_portfolio_implements_on_program_id", using: :btree
  add_index "portfolio_implements", ["project_id"], name: "index_portfolio_implements_on_project_id", using: :btree

  create_table "portfolios", force: true do |t|
    t.integer  "issue_id"
    t.integer  "source_id"
    t.integer  "department_id"
    t.integer  "portfolio_id"
    t.string   "portfolio_type"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.boolean  "visible",                                        default: false
    t.boolean  "is_risky",                                       default: false
    t.boolean  "not_in_line",                                    default: false
    t.boolean  "not_related",                                    default: false
    t.boolean  "not_pest",                                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",                                       default: false
    t.boolean  "appeal",                                         default: false
    t.text     "decision"
    t.integer  "user_id"
  end

  add_index "portfolios", ["department_id"], name: "index_portfolios_on_department_id", using: :btree
  add_index "portfolios", ["issue_id"], name: "index_portfolios_on_issue_id", using: :btree
  add_index "portfolios", ["source_id"], name: "index_portfolios_on_source_id", using: :btree

  create_table "programs", force: true do |t|
    t.integer  "issue_id"
    t.integer  "source_id"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.decimal  "rank",                  precision: 6,  scale: 4
    t.boolean  "visible",                                        default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_risky"
    t.boolean  "not_in_line"
    t.boolean  "not_related"
    t.boolean  "not_pest"
    t.integer  "department_id"
  end

  add_index "programs", ["department_id"], name: "index_programs_on_department_id", using: :btree
  add_index "programs", ["issue_id"], name: "index_programs_on_issue_id", using: :btree
  add_index "programs", ["source_id"], name: "index_programs_on_source_id", using: :btree

  create_table "projects", force: true do |t|
    t.integer  "issue_id"
    t.integer  "program_id"
    t.integer  "source_id"
    t.string   "title"
    t.text     "description"
    t.text     "performance_indicator"
    t.text     "target"
    t.decimal  "amount",                precision: 12, scale: 2
    t.date     "start"
    t.date     "completion"
    t.decimal  "rank",                  precision: 6,  scale: 4
    t.boolean  "visible",                                        default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_risky"
    t.boolean  "not_in_line"
    t.boolean  "not_related"
    t.boolean  "not_pest"
    t.integer  "department_id"
  end

  add_index "projects", ["department_id"], name: "index_projects_on_department_id", using: :btree
  add_index "projects", ["issue_id"], name: "index_projects_on_issue_id", using: :btree
  add_index "projects", ["program_id"], name: "index_projects_on_program_id", using: :btree
  add_index "projects", ["source_id"], name: "index_projects_on_source_id", using: :btree

  create_table "rank_carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
    t.integer  "user_id"
  end

  add_index "rank_carts", ["portfolio_id"], name: "index_rank_carts_on_portfolio_id", unique: true, using: :btree

  create_table "rank_criteria", force: true do |t|
    t.string   "criteria"
    t.text     "description"
    t.decimal  "weight",      precision: 5, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "rank_items", force: true do |t|
    t.integer  "portfolio_id"
    t.integer  "rank_criterium_id"
    t.integer  "rank_score",                                default: 0
    t.decimal  "weight",            precision: 5, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank_cart_id"
    t.integer  "user_id"
  end

  add_index "rank_items", ["portfolio_id"], name: "index_rank_items_on_portfolio_id", using: :btree
  add_index "rank_items", ["rank_cart_id"], name: "index_rank_items_on_rank_cart_id", using: :btree
  add_index "rank_items", ["rank_criterium_id"], name: "index_rank_items_on_rank_criterium_id", using: :btree

  create_table "relations", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "justification"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "relations", ["linkable_id", "linkable_type"], name: "index_relations_on_linkable_id_and_linkable_type", using: :btree

  create_table "reports", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "portfolio_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
  end

  add_index "reports", ["portfolio_id"], name: "index_reports_on_portfolio_id", using: :btree

  create_table "risks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.text     "probability"
    t.text     "severity"
    t.text     "mitigation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "riskiness_id"
    t.string   "riskiness_type"
    t.integer  "user_id"
  end

  add_index "risks", ["riskiness_id", "riskiness_type"], name: "index_risks_on_riskiness_id_and_riskiness_type", using: :btree

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
    t.integer  "user_id"
  end

  add_index "sectors", ["city_id"], name: "index_sectors_on_city_id", using: :btree

  create_table "sources", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "amount",      precision: 16, scale: 2
    t.date     "budget_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "due_date"
    t.integer  "done"
    t.integer  "portfolio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",             limit: 25
    t.string   "last_name",              limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 25, default: ""
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "department_id"
    t.integer  "role"
    t.boolean  "is_active",                         default: false
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
