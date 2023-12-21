class Offer < ApplicationRecor
  belongs_to :user

  has_one_attached :photo

  #validates :description, lenght: { minimum: 20 }
  validates :price, presence: true
  include PgSearch::Model # incluya todo el codigo de la gema pgsearch
  pg_search_scope :search_sitters, #cree adentro de pg search un metodo llamado search_sitters
  against: [ :description, :date_from, :date_to ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
