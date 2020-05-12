class RemoveResidentFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :resident, foreign_key: true
  end
end
