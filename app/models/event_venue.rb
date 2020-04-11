class EventVenue < ApplicationRecord
  has_many :events

  validates :name, :address, presence: true
  validates :name, :address, numericality: { only_integer: true }
  validates :name, :address, length: { minimum:10 }
end
