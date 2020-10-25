class AddPaycountBorrowingToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pay_count, :integer, null: false,default: 0
    add_column :posts, :borrowing, :integer, null: false,default: 0
  end
end
