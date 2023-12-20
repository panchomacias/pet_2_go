class Offer < ApplicationRecord

  belongs_to :user

  has_one_attached :photo

  validates :description, length: { minimum: 20 }
  validates :price, presence: true

end
