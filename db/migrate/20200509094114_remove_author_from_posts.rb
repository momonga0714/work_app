class RemoveAuthorFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :total_costs, :integer
    remove_column :posts, :profit, :integer
    remove_column :posts, :total_sales, :integer
  end
end
