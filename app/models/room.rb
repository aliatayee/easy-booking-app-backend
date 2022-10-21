class Room < ApplicationRecord
  belongs_to :room_type
  belongs_to :user

  validates :number_of_beds, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
