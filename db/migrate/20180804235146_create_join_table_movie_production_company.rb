class CreateJoinTableMovieProductionCompany < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movies, :production_companies do |t|
      t.index [:movie_id, :production_company_id], :name => 'short_name_for_movie_production_company_index'
    end
  end
end
