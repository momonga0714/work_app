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

  # validates :sell_year, :numericality => { :greater_than_or_equal_to =>  :buy_year } 
  # validates :sell_month, :numericality => { :greater_than_or_equal_to =>  :buy_month } 
  # validates :sell_day,numericality: {only_integer: true},:numericality => { :greater_than_or_equal_to =>  :buy_day } 
  # validates :buy_year, numericality: {only_integer: true}
  # validates :buy_month, numericality: {only_integer: true}
  # validates :buy_day, numericality: {only_integer: true}
  validates :sell_year,  numericality: {only_integer: true},:numericality => { :greater_than_or_equal_to =>  :buy_year } 
  validates :sell_month, numericality: {only_integer: true}
  validates :sell_day,   numericality: {only_integer: true}
  validates :buy_year,   presence: true,numericality: {only_integer: true}
  validates :buy_month,  presence: true,numericality: {only_integer: true}
  validates :buy_day,    presence: true,numericality: {only_integer: true}
end