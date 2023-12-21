class AddReferencesToReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :offer, null: false, foreign_key: true #le agrego un offer_id
  end
end
