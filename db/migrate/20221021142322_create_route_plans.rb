class CreateRoutePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :route_plans do |t|
      t.string :route_name
      t.string :merchandiser
      t.string :outlets
      t.string :location
      t.string :time


      t.timestamps
    end
  end
end
