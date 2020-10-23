class AddDateColmunToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :str_date, :date, null: false, default: 0
    add_column :posts, :fin_date, :date ,null: false, default: 0
  end
end
