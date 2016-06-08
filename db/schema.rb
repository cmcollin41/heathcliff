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

ActiveRecord::Schema.define(version: 20160607200700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "prompt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charges", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "stripe_id"
    t.integer  "amount"
    t.string   "card_last4"
    t.string   "card_type"
    t.string   "card_exp_year"
    t.string   "card_exp_month"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "word"
    t.integer  "prompt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "keywords", ["prompt_id"], name: "index_keywords_on_prompt_id", using: :btree

  create_table "members", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "member_type"
    t.string   "business_name"
    t.string   "specialty"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "stripe_id"
    t.string   "card_last4"
    t.string   "card_exp_month"
    t.string   "card_exp_year"
    t.string   "card_type"
    t.string   "phone"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "prompts", force: :cascade do |t|
    t.string   "category"
    t.text     "description"
    t.string   "keyword"
    t.string   "target_audience"
    t.string   "length"
    t.integer  "member_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.date     "due_date"
    t.integer  "status",          default: 0
    t.integer  "business_id"
  end

  add_index "prompts", ["member_id"], name: "index_prompts_on_member_id", using: :btree

end
