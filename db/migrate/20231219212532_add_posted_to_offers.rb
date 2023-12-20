class AddPostedToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :posted, :date
  end
end
