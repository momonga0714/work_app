class RemoveAuthorFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :total_costs, :integer, null: false,default: 0
    remove_column :posts, :profit, :integer, null: false,default: 0
    remove_column :posts, :total_sales, :integer, null: false,default: 0
  end
end
