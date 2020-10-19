class RemoveAuthorFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :total_costs, :integer,default: 0
    remove_column :posts, :profit, :integer,default: 0
    remove_column :posts, :total_sales, :integer,default: 0
  end
end
