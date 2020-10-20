class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string  :name
      t.integer :buy  , null: false,default: 0
      t.integer :buy_brokerage_fee, null: false,default: 0
      t.integer :registration_fee, null: false,default: 0
      t.integer :real_estate_acquisition_tax, null: false,default: 0
      t.integer :property_tax, null: false,default: 0
      t.integer :buy_stamp_cost, null: false,default: 0
      t.integer :repair_cost, null: false,default: 0
      t.integer :interest_rate, null: false,default: 0
      t.integer :rent_cost, null: false,default: 0
      t.integer :banking_fee, null: false,default: 0
      t.integer :management_fee, null: false,default: 0
      t.integer :fire_insurance, null: false,default: 0
      t.integer :sell, null: false,default: 0
      t.integer :surveying_cost, null: false,default: 0
      t.integer :sell_brokerage_fee, null: false,default: 0
      t.integer :sell_stamp_cost, null: false,default: 0
      t.integer :buy_year
      t.integer :buy_month
      t.integer :buy_day
      t.integer :sell_year
      t.integer :sell_month
      t.integer :sell_day
      t.integer :total_costs, null: false,default: 0
      t.integer :total_sales, null: false,default: 0
      t.integer :profit, null: false,default: 0
      t.integer :debt, null: false,default: 0
      t.integer :net_worth, null: false,default: 0
      t.integer :cash_flow, null: false,default: 0
      t.integer :ownership_period, null: false,default: 0
      t.string :house_layout, null: false,default: 0
      t.integer :m2, null: false,default: 0
      t.timestamps
    end
  end
end
