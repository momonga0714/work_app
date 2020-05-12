class AddRentYearColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :rent_year, :integer
    add_column :posts, :rent_month, :integer
    add_column :posts, :rent_day, :integer
  end
end
