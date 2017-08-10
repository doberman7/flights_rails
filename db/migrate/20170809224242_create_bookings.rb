class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.decimal :total, precision: 2, scale: 12
      t.belongs_to :flight, index: true
      t.timestamps
    end
  end
end
