require 'rails_helper'

RSpec.describe Movie, type: :model do
  let!(:movies) { create_list(:movie, 3) }
  let(:movie_title) { movies.first.title }
  let(:director_name) { movies.first.director }
  let(:writer_name) { movies.first.writer }
  let!(:actors) { create_list(:actor, 1) }
  let(:actor_name) { actors.first.name }
  let!(:production_companies) { create_list(:production_company, 1) }
  let(:production_company_name) { production_companies.first.name }
  
  it 'should filter by title' do
    filter_by_title = Movie.filter(movie_title, nil, nil, nil, nil)
    expect(filter_by_title.count).to be 1
  end

  it 'should filter by director' do
    filter_by_directors = Movie.filter(nil, director_name, nil, nil, nil)
    expect(filter_by_directors.count).to be 1
  end

  it 'should filter by writer' do
    filter_by_writers = Movie.filter(nil, nil, writer_name, nil, nil)
    expect(filter_by_writers.count).to be 1
  end

  it 'should filter by actor' do
    movies.first.actors << actors.first
    actors.first.movies << movies.first
    filter_by_actors = Movie.filter(nil, nil, nil, actor_name, nil)
    expect(filter_by_actors.count).to be 1
  end

  it 'should filter by production_company' do
    movies.first.production_companies << production_companies.first
    production_companies.first.movies << movies.first
    filter_by_production_companies = Movie.filter(nil, nil, nil, nil, production_company_name)
    expect(filter_by_production_companies.count).to be 1
  end

  it { should have_and_belong_to_many(:locations) }
  it { should have_and_belong_to_many(:actors) }
  it { should have_and_belong_to_many(:production_companies) }
end
