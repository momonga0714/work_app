class AddBrokerageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :brokerage_fee, :integer,default: 0
  end
end
