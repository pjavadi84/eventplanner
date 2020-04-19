class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      
      t.timestamps
    end
  end
end
