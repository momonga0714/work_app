class AddDateColmunToResidents < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :rent_date, :date, null: false 
    add_column :residents, :move_date, :date, null: false
  end
end
