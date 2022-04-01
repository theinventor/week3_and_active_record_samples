class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.date :arrival_date
      t.date :departure_date
      t.string :destination_city

      t.timestamps
    end
  end
end
