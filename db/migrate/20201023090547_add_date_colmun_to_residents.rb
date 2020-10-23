class AddDateColmunToResidents < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :rent_date, :date, null: false, default: 0
    add_column :residents, :move_date, :date, null: false, default: 0
  end
end
