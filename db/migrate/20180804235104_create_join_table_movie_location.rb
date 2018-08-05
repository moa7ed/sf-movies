class CreateJoinTableMovieLocation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movies, :locations do |t|
      # t.index [:movie_id, :location_id]
      # t.index [:location_id, :movie_id]
    end
  end
end
