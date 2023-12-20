class AddColumnsToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :date_from, :date
    add_column :bookings, :date_to, :date
  end
end
