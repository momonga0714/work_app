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

  validate :date_not_before_fin
  
  def date_not_before_fin
    errors.add(:str_date, "は売却日以前を選択してください") if str_date.nil? || str_date > fin_date
  end
  
end