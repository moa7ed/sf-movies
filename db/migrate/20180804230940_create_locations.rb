class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address, null: false
      t.float :lat
      t.float :long

      t.timestamps
    end
    add_index :locations, :address, unique: true
  end
end
