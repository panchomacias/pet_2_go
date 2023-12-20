class AddNameToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :name, :string
  end
end
