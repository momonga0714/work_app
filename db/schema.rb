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

ActiveRecord::Schema.define(version: 2020_05_11_034256) do

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "buy"
    t.integer "buy_brokerage_fee"
    t.integer "registration_fee"
    t.integer "real_estate_acquisition_tax"
    t.integer "property_tax"
    t.integer "buy_stamp_cost"
    t.integer "repair_cost"
    t.integer "interest_rate"
    t.integer "rent_cost"
    t.integer "banking_fee"
    t.integer "management_fee"
    t.integer "fire_insurance"
    t.integer "sell"
    t.integer "surveying_cost"
    t.integer "sell_brokerage_fee"
    t.integer "sell_stamp_cost"
    t.integer "buy_year"
    t.integer "buy_month"
    t.integer "buy_day"
    t.integer "sell_year"
    t.integer "sell_month"
    t.integer "sell_day"
    t.integer "debt"
    t.integer "net_worth"
    t.integer "cash_flow"
    t.integer "ownership_period"
    t.string "house_layout"
    t.integer "m2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "explanation"
    t.bigint "user_id", null: false
    t.integer "b_income"
    t.integer "other_cost"
    t.integer "m_management_fee"
    t.integer "m_repair_fund"
    t.integer "rent_year"
    t.integer "rent_month"
    t.integer "rent_day"
    t.integer "move_year"
    t.integer "move_month"
    t.integer "move_day"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "residents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "income"
    t.integer "rent_y"
    t.integer "rent_m"
    t.integer "rent_d"
    t.integer "move_y"
    t.integer "move_m"
    t.integer "move_d"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "residents", "posts"
end
