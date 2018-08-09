require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let!(:locations) { create_list(:location, 1) }
  let(:loacation_address) { locations.first.address }
  
  describe "Search" do
    it "for addresses" do
      get :search
      parse_json = JSON(response.body)
      parse_json[0]["address"].should == loacation_address
    end
  end
end
