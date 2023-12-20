class AddDatesToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :date_from, :date
    add_column :offers, :date_to, :date
  end
end
