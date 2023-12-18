class Offer < ApplicationRecord

  belongs_to :user

  has_many_attached :photos

  validates :description, lenght: {minimum: 20}
  validates :price, presence: true

end
