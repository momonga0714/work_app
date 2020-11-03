class AddBrokerageSellToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :brokerage_fee_sell, :integer,default: 0
  end
end
