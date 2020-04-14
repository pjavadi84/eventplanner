class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :ticket_price
      t.integer :minimum_age
      t.string :event_type
      t.belongs_to :user, null: false, foreign_key: true 
      t.belongs_to :property, null: false, foreign_key: true
      t.timestamps
    end
  end
end
