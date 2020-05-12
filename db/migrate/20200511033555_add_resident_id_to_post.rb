class AddResidentIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :resident, foreign_key: true
  end
end
