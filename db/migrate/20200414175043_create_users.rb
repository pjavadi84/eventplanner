class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.boolean :host, default: false
      t.string "uid"
      t.belongs_to :event, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
