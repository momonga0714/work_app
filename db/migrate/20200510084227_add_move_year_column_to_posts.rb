class AddMoveYearColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :move_year, :integer
    add_column :posts, :move_month, :integer
    add_column :posts, :move_day, :integer
  end
end
