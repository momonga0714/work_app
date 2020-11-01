class AddBuildingvaluesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :building_values, :integer,null: false,default: 0
  end
end
