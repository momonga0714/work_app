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

ActiveRecord::Schema.define(version: 2020_10_23_090547) do

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "buy", default: 0, null: false
    t.integer "buy_stamp_cost", default: 0, null: false
    t.integer "repair_cost", default: 0, null: false
    t.integer "interest_rate", default: 0, null: false
    t.integer "rent_cost", default: 0, null: false
    t.integer "banking_fee", default: 0, null: false
    t.integer "management_fee", default: 0, null: false
    t.integer "fire_insurance", default: 0, null: false
    t.integer "sell", default: 0, null: false
    t.integer "surveying_cost", default: 0, null: false
    t.integer "sell_stamp_cost", default: 0, null: false
    t.integer "debt", default: 0, null: false
    t.integer "net_worth", default: 0, null: false
    t.integer "cash_flow", default: 0, null: false
    t.integer "ownership_period", default: 0, null: false
    t.string "house_layout", default: "0", null: false
    t.integer "m2", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "explanation"
    t.integer "b_income", default: 0, null: false
    t.integer "other_cost", default: 0, null: false
    t.integer "m_management_fee", default: 0, null: false
    t.integer "m_repair_fund", default: 0, null: false
    t.bigint "user_id"
    t.integer "values", default: 0, null: false
    t.date "str_date", null: false
    t.date "fin_date", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "residents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "income", default: 0
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "rent_date", null: false
    t.date "move_date", null: false
    t.index ["post_id"], name: "index_residents_on_post_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "posts", "users"
  add_foreign_key "residents", "posts"
end
