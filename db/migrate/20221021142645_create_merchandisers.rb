class CreateMerchandisers < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandisers do |t|
      t.string :username
      t.string :image
      t.string :role
      t.integer :phone_number
      t.string :email
      t.string :password_digest
      t.string :location
      t.float :longitude
      t.float :latitude
      # t.references :route_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
