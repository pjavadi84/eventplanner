class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.float :ticket_price
      t.integer :minimum_age
      t.string :event_type
      t.integer :number_of_guests
      t.date :event_date
      t.belongs_to :property, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
