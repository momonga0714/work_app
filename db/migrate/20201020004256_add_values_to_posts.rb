class AddValuesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :values, :integer,null: false,default: 0
  end
end
