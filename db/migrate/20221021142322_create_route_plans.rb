class CreateRoutePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :route_plans do |t|
      t.string :name
      t.string :month
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
