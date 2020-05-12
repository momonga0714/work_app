class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string  :name
      t.integer :buy
      t.integer :buy_brokerage_fee
      t.integer :registration_fee
      t.integer :real_estate_acquisition_tax
      t.integer :property_tax
      t.integer :buy_stamp_cost
      t.integer :repair_cost
      t.integer :interest_rate
      t.integer :rent_cost
      t.integer :banking_fee
      t.integer :management_fee
      t.integer :fire_insurance
      t.integer :sell
      t.integer :surveying_cost
      t.integer :sell_brokerage_fee
      t.integer :sell_stamp_cost
      t.integer :buy_year
      t.integer :buy_month
      t.integer :buy_day
      t.integer :sell_year
      t.integer :sell_month
      t.integer :sell_day
      t.integer :total_costs
      t.integer :total_sales
      t.integer :profit
      t.integer :debt
      t.integer :net_worth
      t.integer :cash_flow
      t.integer :ownership_period
      t.string :house_layout
      t.integer :m2
      t.timestamps
    end
  end
end
