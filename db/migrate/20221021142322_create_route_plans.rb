class CreateRoutePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :route_plans do |t|
      t.string :name
      t.string :month
      t.integer :outlet_id
      t.integer :merchandiser_id


      t.timestamps
    end
  end
end
