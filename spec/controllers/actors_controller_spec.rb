require 'rails_helper'

RSpec.describe ActorsController, type: :controller do
  let!(:actors) { create_list(:actor, 1) }
  let(:actor_name) { actors.first.name }
  
  describe "Search" do
    it "for actors" do
      get :search
      parse_json = JSON(response.body)
      parse_json[0]["actor"].should == actor_name
    end
  end
end
