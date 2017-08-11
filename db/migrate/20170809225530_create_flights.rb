class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :total_seats
      t.string :destiny
      t.string :origin      
      t.datetime :depart
      t.decimal :cost, precision: 2, scale: 12

      t.timestamps
    end
  end
end
