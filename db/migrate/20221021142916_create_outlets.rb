class CreateOutlets < ActiveRecord::Migration[7.0]
  def change
    create_table :outlets do |t|
      t.string :name
      t.string :location
      # t.references :route_plan, null: false, foreign_key: true
      # t.references :merchandiser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
