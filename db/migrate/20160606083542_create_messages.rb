class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.float :lat
      t.float :lon
      t.references :user, index: true, foreign_key: true
      t.string :target_email
      t.string :address
      t.string :picture

      t.timestamps null: false
    end
  end
end
