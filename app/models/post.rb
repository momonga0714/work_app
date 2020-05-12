class Post < ApplicationRecord
  belongs_to :user,optional: true
  has_many :residents
  def self.search(search)
    if search
      Post.where(['name LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
