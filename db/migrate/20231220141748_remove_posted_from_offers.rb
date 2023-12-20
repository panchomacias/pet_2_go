class RemovePostedFromOffers < ActiveRecord::Migration[7.1]
  def change
    remove_column :offers, :posted, :date
  end
end
