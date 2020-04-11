class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validates :email, :name, :lastname, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

end
