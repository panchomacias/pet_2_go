class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :description
      t.float :price
      t.date :calendar
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
