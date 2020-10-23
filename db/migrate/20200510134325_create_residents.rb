class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|
      t.string :name
      t.integer :income,default: 0
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
