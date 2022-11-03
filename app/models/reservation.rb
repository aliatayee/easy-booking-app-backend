class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :from_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :to_date, comparison: { greater_than_or_equal_to: :from_date }
  validates :denial_reason, length: { maximum: 255 }
end
