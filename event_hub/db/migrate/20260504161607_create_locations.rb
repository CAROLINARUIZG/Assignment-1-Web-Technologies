class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :default_capacity

      t.timestamps
    end
  end
end
