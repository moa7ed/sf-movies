require 'rails_helper'

RSpec.describe Location, type: :model do
  let!(:movies) { create_list(:movie, 3) }
  let(:movie_title) { movies.first.title }
  let!(:locations) { create_list(:location, 2) }
  let!(:location_address) { locations.first.address }

  it 'should filter by movies' do
    locations.first.movies << movies.first
    filter_by_title = Location.filter([movie_title], nil)
    expect(filter_by_title.count).to be 1
  end

  it 'should filter by addresses' do
    filter_by_addresses = Location.filter(nil, location_address)
    expect(filter_by_addresses.count).to be 1
  end

  it { should have_and_belong_to_many(:movies) }

  it 'check if location in san francisco' do
    l = Location.new
    l.address = "inside san francisco"
    l.lat = 37.763120
    l.long = -122.451158
    expect(l.in_san_francisco?).to be true
    l.address = "outside san francisco"
    l.lat = 0
    l.long = 0
    expect(l.in_san_francisco?).to be false
  end
end
