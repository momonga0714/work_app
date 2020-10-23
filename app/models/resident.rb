class Resident < ApplicationRecord
  belongs_to :post

  
  validate :date_not_before_move

  def date_not_before_move
    errors.add(:rent_date, "は退去日以前を選択してください") if rent_date.nil? || rent_date > move_date
  end
end
