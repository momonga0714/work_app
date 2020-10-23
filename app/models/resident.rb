class Resident < ApplicationRecord
  belongs_to :post

  # validates :move_y, numericality: {only_integer: true}, :numericality => { :greater_than_or_equal_to =>  :rent_y } 
  # validates :move_m, numericality: {only_integer: true}, :numericality => { :greater_than_or_equal_to =>  :rent_m } 
  # validates :move_d, numericality: {only_integer: true}, :numericality => { :greater_than_or_equal_to =>  :rent_d } 
  # validates :rent_y, numericality: {only_integer: true}
  # validates :rent_m, numericality: {only_integer: true}
  # validates :rent_d, numericality: {only_integer: true}
  validates :move_y, numericality: {only_integer: true},:numericality => { :greater_than_or_equal_to =>  :rent_y } 
  validates :move_m, numericality: {only_integer: true}
  validates :move_d, numericality: {only_integer: true}
  validates :rent_y, numericality: {only_integer: true}
  validates :rent_m, numericality: {only_integer: true}
  validates :rent_d, numericality: {only_integer: true}
end
