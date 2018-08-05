class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.integer :release_year
      t.string :director
      t.string :writer

      t.timestamps
    end
    add_index :movies, :title, unique: true
  end
end
