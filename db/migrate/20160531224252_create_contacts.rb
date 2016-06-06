class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contactings do |t|
      t.string :nickname
      t.integer :user_id
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
