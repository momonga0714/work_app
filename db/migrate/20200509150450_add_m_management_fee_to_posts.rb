class AddMManagementFeeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :m_management_fee, :integer,default: 0
    add_column :posts, :m_repair_fund, :integer,default: 0
  end
end
