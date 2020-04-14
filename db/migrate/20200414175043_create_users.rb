class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :age
      t.integer :budget
      t.string :event_type
      t.boolean :host, default: false
      t.boolean :gender, default: false

      t.timestamps
    end
  end
end
