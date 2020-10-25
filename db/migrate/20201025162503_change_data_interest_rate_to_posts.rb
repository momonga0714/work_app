class ChangeDataInterestRateToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :interest_rate, :float, null: false, default: 0
  end
end
