class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
    end
  end
end
