require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movies) { create_list(:movie, 1) }
  let(:movie_name) { movies.first.title }
  let(:director_name) { movies.first.director }
  let(:writer_name) { movies.first.writer }
  
  describe "Search" do
    it "for movies" do
      get :search
      parse_json = JSON(response.body)
      parse_json[0]["title"].should == movie_name
    end

    it "for directors" do
      get :search_for_directors
      parse_json = JSON(response.body)
      parse_json[0]["director"].should == director_name
    end

    it "for writers" do
      get :search_for_writers
      parse_json = JSON(response.body)
      parse_json[0]["writer"].should == writer_name
    end
  end
end
