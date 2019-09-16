class Address < ApplicationRecord
  belongs_to :user

  validates :house_number, numericality: { only_integer: true }, if: :house_number
  validates :city, presence: true
end
