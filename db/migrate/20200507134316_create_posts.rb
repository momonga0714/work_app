class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string  :name
      t.integer :buy  ,default: 0
      t.integer :buy_brokerage_fee,default: 0
      t.integer :registration_fee,default: 0
      t.integer :real_estate_acquisition_tax,default: 0
      t.integer :property_tax,default: 0
      t.integer :buy_stamp_cost,default: 0
      t.integer :repair_cost,default: 0
      t.integer :interest_rate,default: 0
      t.integer :rent_cost,default: 0
      t.integer :banking_fee,default: 0
      t.integer :management_fee,default: 0
      t.integer :fire_insurance,default: 0
      t.integer :sell,default: 0
      t.integer :surveying_cost,default: 0
      t.integer :sell_brokerage_fee,default: 0
      t.integer :sell_stamp_cost,default: 0
      t.integer :buy_year,default: 0
      t.integer :buy_month,default: 0
      t.integer :buy_day,default: 0
      t.integer :sell_year,default: 0
      t.integer :sell_month,default: 0
      t.integer :sell_day,default: 0
      t.integer :total_costs,default: 0
      t.integer :total_sales,default: 0
      t.integer :profit,default: 0
      t.integer :debt,default: 0
      t.integer :net_worth,default: 0
      t.integer :cash_flow,default: 0
      t.integer :ownership_period,default: 0
      t.string :house_layout,default: 0
      t.integer :m2,default: 0
      t.timestamps
    end
  end
end
