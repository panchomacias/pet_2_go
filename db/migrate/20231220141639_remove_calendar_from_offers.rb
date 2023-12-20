class RemoveCalendarFromOffers < ActiveRecord::Migration[7.1]
  def change
    remove_column :offers, :calendar, :date
  end
end
