class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :event_type
      t.date :date_created
      t.integer :maximum_occupancy
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
