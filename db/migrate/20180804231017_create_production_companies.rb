class CreateProductionCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :production_companies do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :production_companies, :name, unique: true
  end
end
