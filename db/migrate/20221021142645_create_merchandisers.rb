class CreateMerchandisers < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandisers do |t|
      t.string :username
      t.string :image
      t.integer :phone_number
      t.string :email
      t.string :password_digest
      t.string :location
      # t.references :route_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
