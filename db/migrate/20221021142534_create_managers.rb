class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :username
      t.string :image
      t.string :role
      t.integer :phone_number
      t.string :email
      t.string :password_digest
      t.string :location

      t.timestamps
    end
  end
end
