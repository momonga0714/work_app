class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|
      t.string :name
      t.integer :income,default: 0
      t.integer :rent_y
      t.integer :rent_m
      t.integer :rent_d
      t.integer :move_y
      t.integer :move_m
      t.integer :move_d
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
