class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :total_attending
      t.datetime :date_booked
      
      t.timestamps
    end
  end
end
