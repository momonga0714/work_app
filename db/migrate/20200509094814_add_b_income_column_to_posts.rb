class AddBIncomeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :b_income, :integer
    add_column :posts, :other_cost, :integer
  end
end
