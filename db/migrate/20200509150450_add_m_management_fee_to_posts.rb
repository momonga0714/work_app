class AddMManagementFeeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :m_management_fee, :integer
    add_column :posts, :m_repair_fund, :integer
  end
end
