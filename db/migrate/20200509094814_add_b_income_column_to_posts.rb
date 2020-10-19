class AddBIncomeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :b_income, :integer, null: false,default: 0
    add_column :posts, :other_cost, :integer, null: false,default: 0
  end
end
