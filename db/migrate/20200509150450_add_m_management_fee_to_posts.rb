class AddMManagementFeeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :m_management_fee, :integer, null: false,default: 0
    add_column :posts, :m_repair_fund, :integer, null: false,default: 0
  end
end
